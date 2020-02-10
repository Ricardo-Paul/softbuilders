class User < ApplicationRecord
  before_create :generate_authentication_token!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :auth_token, uniqueness: true

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",
                    url: "/media/:id/:style/:hash.:extension",
                    path: ":rails_root/public/media/:id/:style/:hash.:extension",
                    hash_secret: "tamtam"

  validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

    def generate_authentication_token!
      begin
        self.auth_token = Devise.friendly_token
      end while self.class.exists?(auth_token: auth_token)
    end

    has_many :projects, dependent: :destroy
    has_many :contributors
    has_many :contributed_projects, :class_name => "Project", :through => :contributors, source: :project
end
