# frozen_string_literal: true

class SyncLabelWorker
  include Sidekiq::Worker

  def perform
    Repository.all.each do |repository|
      repository.attach_missing_labels
      repository.sync_label_colors_and_descriptions
    end
  end
end
