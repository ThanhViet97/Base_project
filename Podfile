platform :ios, '10.0'
use_frameworks!
inhibit_all_warnings!
install! 'cocoapods', :deterministic_uuids => false


def baseMVVM_Pods
  pod 'FirebaseUI/Auth'
  pod 'FirebaseUI/Google'
  pod 'FirebaseUI/Facebook'
  pod 'FirebaseUI/OAuth' # Used for Sign in with Apple, Twitter, etc
  pod 'FirebaseUI/Phone'
  pod 'Kingfisher'
end

target 'Base_Project' do
 baseMVVM_Pods
end

target 'Base_ProjectTests' do
  inherit! :search_paths
  # Pods for testing
end

target 'Base_ProjectUITests' do
   # Pods for testing
end
