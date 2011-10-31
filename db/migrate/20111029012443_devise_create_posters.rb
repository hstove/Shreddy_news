class DeviseCreatePosters < ActiveRecord::Migration
  def self.up
    create_table(:posters) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :posters, :email,                :unique => true
    add_index :posters, :reset_password_token, :unique => true
    # add_index :posters, :confirmation_token,   :unique => true
    # add_index :posters, :unlock_token,         :unique => true
    # add_index :posters, :authentication_token, :unique => true
  end

  def self.down
    drop_table :posters
  end
end
