class Post < ActiveRecord::Base
    
    belongs_to :user
    has_many :comments
    has_many :likes
    
    def humanized_time_ago
        time_ago_in_seconds = Time.now - self.created_at
        time_ago_in_minutes = time_ago_in_seconds / 60
        time_ago_in_hours = time_ago_in_seconds / 3600
        
        if time_ago_in_hours >= 24
            "#{((time_ago_in_hours / 24).ceil).to_s} days ago"
        elsif time_ago_in_minutes >= 60
            "#{time_ago_in_hours.to_i} hours ago"
        else
            "#{time_ago_in_minutes.to_i} minutes ago"
        end
        
    end
    
    def like_count
        self.likes.size
    end
    
    def comment_count
        self.comments.size
    end
    
end