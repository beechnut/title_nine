require 'open-uri'
class Update < ActiveRecord::Base

  # validates :data, presence: true
  after_create :set_filename
  after_create :perform

  def perform
    if Update.where(filename: filename).count > 1
      update_attribute :performed, false
    else
      update
    end
  end
  
  def data
    CSV.parse read_attribute(:data).to_s
  end

  private

  def update
    update_attributes(
      performed: true,
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

  def set_filename
    update_attribute :filename, filename
  end

end
