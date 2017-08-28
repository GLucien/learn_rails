class User < ApplicationRecord
  # follow a user
  # 例子：A用户关注B用户
  # 需要在redis中记录如下信息
  # 1.A关注着B
  # 2.B的关注者有A
  def follow!(user)
    # multi标志着一个事物的开始
    $redis.multi do
      $redis.sadd(self.redis_key(:following), user.id)
      $redis.sadd(user.redis_key(:followers), self.id)
    end
  end

  # unfollow a user
  def unfollow!(user)
    $redis.multi do
      $redis.srem(self.redis_key(:following), user.id)
      $redis.srem(user.redis_key(:followers), self.id)
    end
  end

  # users that self follows
  def followers
    user_ids = $redis.smembers(self.redis_key(:followers))
    User.where(:id => user_ids)
  end

  # users that follow self
  def following
    user_ids = $redis.smembers(self.redis_key(:following))
    User.where(:id => user_ids)
  end

  # users who follow and are being followed by self
  def friends
    user_ids = $redis.sinter(self.redis_key(:following), self.redis_key(:followers))
    User.where(:id => user_ids)
  end

  # does the user follow self
  def followed_by?(user)
    $redis.sismember(self.redis_key(:followers), user.id)
  end

  # does self follow user
  def following?(user)
    $redis.sismember(self.redis_key(:following), user.id)
  end

  # number of followers
  def followers_count
    $redis.scard(self.redis_key(:followers))
  end

  # number of users being followed
  def following_count
    $redis.scard(self.redis_key(:following))
  end

  # helper method to generate redis keys
  def redis_key(str)
    "user:#{self.id}:#{str}"
  end
end
