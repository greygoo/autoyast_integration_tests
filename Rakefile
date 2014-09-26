require "rake"


task :test do
  puts "Running autoyast2 integration tests"
  Dir.chdir(File.dirname(__FILE__)+"/../pennyworth") do
    system "pwd"
    system "bin/pennyworth build-base sles11_usertest -d ../autoyast_integration_tests/tests"
  end
end
