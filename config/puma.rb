# frozen_string_literal: true

host_vcpus = ENV['PUMA_WORKERS']&.to_i || Etc.nprocessors
rails_env = ENV['RAILS_ENV'] || 'development'
environment rails_env
workers host_vcpus
min_threads_count = ENV['PUMA_MIN_THREADS']&.to_i || 1
max_threads_count = ENV['PUMA_MAX_THREADS']&.to_i || (min_threads_count + 1)
threads min_threads_count, max_threads_count

case rails_env
when 'development'
  worker_timeout 3600
  port ENV['PORT'] || 3000
  plugin :tmp_restart
when 'production'
  preload_app! if host_vcpus == 1
  bind 'unix:///run/puma/puma.sock'
  pidfile '/run/puma/puma.pid'
  state_path '/run/puma/puma.state'
else
  raise ArgumentError, 'Invalid Puma HTTP Server config'
end
