class Updater

  def initialize(update)
    @data = update.read_attribute(:data)
  end

  def perform
    CSV.parse(@data, csv_opts).each do |row|
      c = Case.find_or_create_by! attributes(row)
      c.touch :updated_at
    end
    Case.closable.each { |c| c.closed! }
  end

  private

  def csv_opts
    { headers: true, converters: :all }
  end

  def attributes(row)
    {
      state:       row['State'],
      institution: row['Institution'],
      opened_at:   Date.strptime(row['Date opened'], "%m/%d/%Y")
    }
  end

end