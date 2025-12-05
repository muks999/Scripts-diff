# Импорт модуля Active Directory
Import-Module ActiveDirectory

# Поиск заблокированных учетных записей
Get-ADUser -Filter {Enabled -eq $true -and LockedOut -eq $true} -Properties LockedOut, LastLogonDate | 
# Выбор нужных свойств и форматирование вывода
Select-Object Name, SamAccountName, LockedOut, LastLogonDate |
# Сортировка по дате последнего входа
Sort-Object LastLogonDate -Descending |
# Вывод в табличном формате
Format-Table -AutoSize
