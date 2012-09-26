require "spec_helper"

module Twitchus

  describe Cli do

    before do
      @old_stderr = $stderr
      $stderr = StringIO.new

      @old_stdout = $stdout
      $stdout = StringIO.new
      # Twitchus.reset_global_options
    end

    after do
      # Twitchus.reset_global_options
      $stderr = @old_stderr
      $stdout = @old_stdout
    end

    def cli_test(argv, env, exit_val, stderr_regex = nil, stdout_regex = nil)
      begin
        cli = Cli.new
        cli.run(argv, env)
        return cli
      rescue SystemExit => e
        e.status.should == exit_val
        $stderr.string.should match stderr_regex if stderr_regex
        $stdout.string.should match stdout_regex if stdout_regex
      end
    end

    it "exits with 1 with invalid options" do
      cli_test(%w{-w}, {}, 1, /invalid option/)
      cli_test(%w{-g foo}, {}, 1, /invalid option/)
    end

    it "exits with 1 if no config is given" do
      cli_test([], {}, 1, /specify a config file/)
    end

    it "exits with 1 if the config file doesn't exist" do
      cli_test(%w{-c foo.yml}, {}, 1, /file you specified doesn't exist/)
    end

    it "exits with 0 if an existing config file is given" do
      File.open("./tmp/config.yml", "w") { |f| f.puts "scvrush1" }
      cli_test(%w{-c ./tmp/config.yml}, {}, 0)
    end

  end

end
