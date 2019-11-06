class TeamPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    current_user.present? && GroupUser.find_by(user: current_user, group_id: record)
  end

  def join?
    current_user.present?
  end

  def update?
    current_user.present? && record.user == current_user
  end

  def add_politician?
    update? && record.politicians.count < 6
  end

  def destroy?
    update?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
