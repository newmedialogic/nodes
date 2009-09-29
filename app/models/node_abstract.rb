class NodeAbstract < ActiveRecord::Base

  DEFAULT_SUMMARY_LENGTH = 600

  belongs_to :node, :polymorphic => true

  before_validation :generate_summary

protected

  def generate_summary
    
    return if self.conect.nil?

    # Short content needn't be split
    self.summary = self.content.dup  and return if self.content.length <= DEFAULT_SUMMARY_LENGTH

    # Chop the content down to size
    self.summary = self.content[0..DEFAULT_SUMMARY_LENGTH]

    # Attempt to preserve full paragraphs, chop off remainder paragraphs
    breakpoints = { '</p>' => 3, '<br />' => 5, '<br/>' => 4, '<br>' => 3 }
    breakpoints.each do |text, split_offset|
      unless (pos = self.summary.rindex(text)).nil?
        self.summary = self.summary[0..(pos + split_offset)]
        return
      end
    end

    # Impossible to preserve paragraph. Split at the end of a sentence
    breakpoints = { /\.\s+/ => 0, /!\s+/ => 0, /\?\s+/ => 0, /。\s+/ => 0, /'؟\s+/ => 0 }
    breakpoints.each do |text, split_offset|
      unless (pos = self.summary.rindex(text)).nil?
        self.summary = self.summary[0..(pos + split_offset)]
        return
      end
    end

  end

end
