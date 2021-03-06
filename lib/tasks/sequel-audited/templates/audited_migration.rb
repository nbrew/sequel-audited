Sequel.migration do
  # created by sequel-audited gem
  
  change do
    
    create_table(:audit_logs) do
      primary_key :id
      # used to track create/updates/deletes
      column :event,            :text
      # the audited model's type  [NB! used for versioning only ]
      column :item_type,        :text
      # the audited model's unique uuid key as string  [NB! used for versioning only]
      column :item_uuid,        :uuid
      
      # JSON object of the audited object
      column :changed,          :json
      
      # the version of the audited object. Scoped on model_type & model_pk
      column :version,          :integer
      
      # who audited the model?
      # tracks the user id (primary key) 
      column :user_id,          :uuid
      # tracks the username
      column :username,         :text
      # allows for tracking of User, Client, Author, etc named models
      column :user_type,        :text
      
      # timestamp when the record was created
      column :created_at,       :timestamp
      
      #
      # add_index :audits, [:auditable_id, :auditable_type], :name => 'auditable_index'
      # add_index :audits, [:associated_id, :associated_type], :name => 'associated_index'
      # add_index :audits, [:user_id, :user_type], :name => 'user_index'
      # add_index :audits, :created_at
      
    end
    
  end
  
end
