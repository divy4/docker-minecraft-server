# #!/usr/bin/env sh
# set -euf pipefail

# echo "eula=$EULA" > eula.txt

# exec java -jar server.jar --nogui --universe /data/

START_COMMAND = 'java -jar server.jar --nogui --universe /data/'

def main()
  accept_eula(ENV['EULA'])
  run_server
end

def accept_eula(eula_value)
  File.write('eula.txt', "eula=#{eula_value}")
end

def run_server
  pipe_out, pipe_in = IO.pipe
  set_signal_handlers(pipe_in)
  process = Process.spawn(START_COMMAND, STDIN=>pipe_out, STDOUT=>:out, STDERR=>:err)
  Process.wait(process)
  exit(Process.last_status.exitstatus)
end

def set_signal_handlers(server_stdin)
  Signal.trap('SIGINT') do
    stop_server(server_stdin)
  end
  Signal.trap('SIGTERM') do
    stop_server(server_stdin)
  end
end

def stop_server(server_stdin)
  puts 'Stopping server...'
  server_stdin.puts('/stop')
end

main()
