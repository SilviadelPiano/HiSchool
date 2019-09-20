FactoryBot.define do 
    factory :user do
        name { "Silvia" }
        surname { "del Piano" }
        roles_mask { "2" }
        CF { "DLPSLV97L67H501J" }
        birth_place { "Roma" }
        sex { "F" }
        email { "silvia.delpiano27@gmail.com" }
        password { "*YukiShiro27" }
        password_confirmation { "*YukiShiro27" }
    end

    factory :school do 
        name { "Peano" }
    end 

    factory :schoolClass do 
        name { "2LS" }
        school_id { "1" }
    end
    
  end