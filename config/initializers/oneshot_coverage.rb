require "json"
require "oneshot_coverage/logger/file_logger"

logfile_path = 'log/oneshot_coverage.log'

begin
  File.open(logfile_path) do |j|
    hash = JSON.load(j)
    raise "empty file" if hash.nil?
  end
rescue
  File.open(logfile_path,"w") do |file|
    file.puts("{}")
  end
end

OneshotCoverage.configure(
  target_path: Rails.root,
  logger: OneshotCoverage::Logger::FileLogger.new(logfile_path),
  emit_term: nil,
)
OneshotCoverage.start
