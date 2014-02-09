# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
User.create({
  email: 'mam@marzenie.org',
  fullname: 'Jan Kowalski',
  region: 'Kraków',
  password: 'marzenie',
  password_confirmation: 'marzenie'
})

Dream.find_or_create_by({
  title:          'Playstation 4/3 + PS Move z grami',
  description:    'Nie ma dla Naszej fundacji piękniejszego i szczęśliwszego
    dnia niż ten, w którym możemy spełnić marzenie Naszych podopiecznych.
    Zawsze są to chwile pełne radości, wzruszenia i umacniania się w
    przekonaniu, że największym bogactwem jest dzielenie się z innymi. W
    pierwszy, słoneczny dzień lutego udaliśmy się do Kacperka spełnić jego
    marzenie. Kacper marzył o PlayStation z grami i zestawem move. Uśmiech na
    twarzy chłopca, który pojawił się na Nasz widok, utwierdził Nas w
    przekonaniu, że o tym właśnie marzył. Nie ma chyba piękniejszych wyrazów
    wdzięczności',
  child_fullname: 'Kacper',
  child_age:      7,
  region:         'Kraków',
  category:       'have',
  status:         'completed',
  step:           4
}).update_attribute(:avatar, File.open(Rails.root.join('public/sample_data/kacper.jpeg')))

Dream.find_or_create_by({
  title:          'Laptop z dostępem do Internetu, z bezprzewodową myszką, pendrivem i czytnikiem linii papilarnych',
  description:    'Dzień, w którym spełnia się dziecięce marzenie powinien być
  absolutnie wyjątkowy. Tak właśnie było 18 sierpnia, gdy podczas koncertu
  Lata z Radiem spełniło się marzenie Łucji o laptopie z dostępem do
  internetu.
  Słoneczne popołudnie, plac pełen ludzi, wielka scena. Do tego
  wakacyjna atmosfera, ale i ogromne emocje – tak w skrócie można opisać to,
  co działo się tamtego dnia.',
  child_fullname: 'Łucja',
  child_age:      11,
  region:         'Kraków',
  category:       'have',
  status:         'completed',
  step:           2
}).update_attribute(:avatar, File.open(Rails.root.join('public/sample_data/lucja.jpeg')))
