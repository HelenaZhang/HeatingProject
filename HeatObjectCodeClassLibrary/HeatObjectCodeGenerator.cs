using System;

namespace HeatObjectCodeClassLibrary
{
    using HeatingProject.Objects;

    public static class HeatObjectCodeGenerator
    {
        public const short maxCountOfDigits = 18;
        public const short maxNameHexLength = 6;

        private static void checkStr(string str, string paramName, string message)
        {
            if (string.IsNullOrEmpty(str))
            {
                throw new ArgumentNullException(paramName, message);
            }
        }

        ///<summary>
        /// Реализация первого алгоритма:
        /// 1 символ - код данного алгоритма (S)
        /// Далее дата в формате ddmmyy без разделителей и только с 2 последними цифрами года
        /// Далее наименование объекта целиком, если влезает в 18 символов
        /// Далее разделитель "-"
        /// Далее часть или полностью номер лицевого счета
        /// </summary>
        /// <remarks>
        /// Предполагается, что наименование объекта:
        /// - не слишком длинное
        /// - это строка
        /// И в целом по дате, имени и части счета можно будет узнать объект
        /// Также предполагается, что номер счета влезает в long и не является отрицательным
        /// </remarks>
        /// <param name="heatObject">Информация об объекте теплопотребления. См. больше в проекте HeatingProject.Objects</param>
        /// <returns>Строка цифро-буквенного кода</returns>

        public static string GetSimpleCode(HeatObject heatObject)
        {
            checkStr(heatObject.objName, "Наименование объекта", "Наименование объекта не может быть пусто");

            var dateStr = $"{heatObject.registryDate:dd}{heatObject.registryDate:MM}{heatObject.registryDate:yy}";
            var resultCode = $"S{dateStr}{heatObject.objName}-{heatObject.personalAccount}";
            resultCode = resultCode.Length > maxCountOfDigits ? resultCode.Remove(maxCountOfDigits) : resultCode;

            return resultCode;
        }

        /// <summary>
        /// Реализация второго алгоритма:
        /// 1 символ - код данного алгоритма (H)
        /// Далее наименование объекта (обрезано до 6 символов, если больше)
        /// Далее разделитель "-"
        /// Далее часть или полностью номер лицевого счета (обрезано до 6 символов)
        /// Далее разделитель "-"
        /// Далее дата в формате mmyy, переведенная в 16ричную систему счисления
        /// </summary>
        /// <remarks>
        /// При обратном переводе даты, если получается строка из 3 цифр - нужно добавить слева ноль
        /// </remarks>
        /// <param name="heatObject">Информация об объекте теплопотребления. См. больше в проекте HeatingProject.Objects</param>
        /// <returns>Строка цифро-буквенного кода</returns>

        public static string GetHexCode(HeatObject heatObject)
        {
            checkStr(heatObject.objName, "Наименование объекта", "Наименование объекта не может быть пусто");

            var dateNum = heatObject.registryDate.Month * 100 + short.Parse(heatObject.registryDate.ToString("yy"));
            var dateStr = dateNum.ToString("X");

            var nameStr = heatObject.objName.Length > maxNameHexLength
                ? heatObject.objName.Remove(maxNameHexLength)
                : heatObject.objName;

            var personalAccStr = heatObject.personalAccount.ToString();
            personalAccStr = personalAccStr.Length > maxNameHexLength
                ? personalAccStr.Remove(maxNameHexLength)
                : personalAccStr;

            return $"H{nameStr}-{personalAccStr}-{dateStr}";
        }
    }
}
