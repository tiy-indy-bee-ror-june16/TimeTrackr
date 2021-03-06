class Project < ApplicationRecord
  has_many :users, through: :userprojects
  has_many :timers
  has_many :userprojects
  belongs_to :owner, :class_name => :User, :foreign_key => "owner_id"
  belongs_to :client, :class_name => :User, :foreign_key => "client_id"
  validates :client_id, presence: true
  validates :owner_id, presence: true

  validates :title, presence: true, uniqueness: true
  validates :estimated_time, presence: true

  attachment :image, type: :image

  default_scope { order(updated_at: :desc) }

  def actual_time
    (Timer.where(project_id: id).sum("value")/3600.0).round(1)
  end

end
