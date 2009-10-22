class CreateNodeVocabularies < ActiveRecord::Migration                                                                                       

  def self.up
    create_table :node_vocabularies do |t|

      t.timestamps

    end

  end

  def self.down
    drop_table :node_vocabularies
  end

end
