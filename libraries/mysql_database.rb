module Rubycas
  module Helper
    module MysqlDatabase
      def database_adapter_gem
        'mysql2'
      end

      def root_user
        'root'
      end

      def database_provider
        Chef::Provider::Database::Mysql
      end

      def database_user_provider
        Chef::Provider::Database::MysqlUser
      end

      def node_root_password
        node[:mysql][:server_root_password]
      end

      def required_recipes
        %w{
          mysql::server
          database::mysql
        }
      end

      def required_client_recipes
        mysql_chef_gem 'default' do
          action :install
        end

        nil
      end
    end
  end
end
