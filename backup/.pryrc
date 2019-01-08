# pry configuration
Pry.config.color = true
# show current ruby version in prompt
Pry.config.prompt = proc do |obj, nest_level, _pry_|
  version = ''
  version << "Rails#{Rails.version}" if defined? Rails
  version << "\001\e[0;31m\002"
  version << " #{RUBY_VERSION}"
  version << "\001\e[0m\002"

  "#{version} #{Pry.config.prompt_name}(#{Pry.view_clip(obj)})> "
end

Pry.config.prompt_name = "🤔  "

# Include Math to use default math methods
include Math

if defined?(PryByebug)
    Pry.commands.alias_command 'c', 'continue'
    Pry.commands.alias_command 's', 'step'
    Pry.commands.alias_command 'n', 'next'
    Pry.commands.alias_command 'f', 'finish'
    Pry.commands.alias_command 'b', 'break'
    Pry.commands.alias_command 'bda', 'break --disable-all'
end

# For rails development
def me
  User.find(18424563)
end

def first_user
  User.first
end

def last_user
  User.last
end

# Useful Collections
def a_array
  (1..8).to_a
end

def a_hash
  {id: 5, title: "Hello Ruby", message: "I am Anton", private: true}
end

def lg_str
 "The knowledge disregards my nominate wallet above a porter. The executive matures in the money. The grandfather orbits above her alert tomato. A chart knocks the staring grave over the balance. Each lit realm argues under the frog."
end

def sm_str
  "Uncommonly no it announcing melancholy an in."
end

def screen_pls
  save_and_open_screenshot("full.png", full: true)
end