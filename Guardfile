# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'cucumber', :all_after_pass => false do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})                      { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { 'features' }
end
