class AuthenticateUser
    prepend SimpleCommand
    
    def initialize(email, password)
      @email = email
      @password = password
    end
    
    def call
      JsonWebToken.encode(user_id: api_user.id) if api_user
    end
    
    private
    
    attr_accessor :email, :password
    
    def api_user          


      user = User.where(email: email).first
      unless user.present?
        errors.add :aviso, "Email ou senha Errada"
        return nil
      end
      
     
      unless user.valid_password?(password)
        errors.add :aviso, "Email ou senha Errada"
        return nil
      end
      
      return user
    end
    
  end