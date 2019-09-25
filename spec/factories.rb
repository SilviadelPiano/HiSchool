FactoryBot.define do 
    factory :user do
        name { "Silvia" }
        surname { "del Piano" }
        roles_mask { "2" } #questo numero può essere uno qualsiasi
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

    factory :school_class_teacher do 
        school_class_id { "1" }
        teacher_id { "1" }
        subject { "Italiano" }
    end 

    factory :post do 
        link { "" }
        deadline { "" }
        user_id { "" }
        description { "[Italiano, 2LS, Peano] Studiate italiano!\nSilvia" }
        school_class_id { "1" }
    end
    
  end