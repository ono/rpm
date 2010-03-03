module NewRelic
  module Agent

    # ForkedTask is a module which provides useful functions for forked tasks
    module ForkedTask
      # Return true if the current process is a forked task.
      def forked_task?
        resque_forked_task?
      end

      # Return true if the current process is a resque task foked by resque worker process.
      def resque_forked_task?
        @task_loop && @task_loop.pid==Process.ppid && $0 =~ /^resque-.*Processing/
      end
    end
  end
end