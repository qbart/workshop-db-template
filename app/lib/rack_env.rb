class RackEnv
  def self.prod?
    ENV["RACK_ENV"] == "production"
  end
end
