class Update < ActiveRecord::Base

  validates :data, presence: true
  after_create :perform

  def perform
    if Update.find_by(filename: filename)
      update_attribute :performed, false
    else
      save_and_update
    end
  end
  
  def data
    CSV.parse read_attribute(:data)
  end

  private

  def save_and_update
    update_attributes(
      performed: true
      data: URI.parse(filename).open.read
    )
    Updater.new(self).perform
  end
  
  def filename
    @f ||= master.data.files.first.raw_url
  end

  def master
    commits = repo.rels[:commits].get(sha: 'master')
    commits.data.first.rels[:self].get
  end

  def repo
    Octokit.repo 'joshua-eaton/Title-IX-investigations'
  end

end
