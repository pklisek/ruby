class ArticlePolicy
  attr_reader :user, :article
  def initialize(user, article)
    @user = user
    @article = article
  end
    def index?
     user.present?
    end

    def destroy?
     return true if article.post_owner == user.email ||user.admin?
    end
    def update?
      return true if article.post_owner == user.email ||user.admin?
     end
     def create?
      user.present?
     end

    
end
