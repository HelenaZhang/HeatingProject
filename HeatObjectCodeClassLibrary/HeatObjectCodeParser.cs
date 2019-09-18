using System;
using HeatingProject.Objects;

namespace HeatObjectCodeClassLibrary
{
    public static class HeatObjectCodeParser
    {
        public static HeatObject ParseCode(string code)
        {
            if (String.IsNullOrEmpty(code))
            {
                throw new ArgumentNullException("Код", "Код не может быть пустым");
            }
            else
            {
                switch (code[0])
                {
                    case 'S':
                        return ParseSimple(code);
                        break;
                    case 'H':
                        return ParseHex(code);
                        break;
                    default:
                        throw new Exception("Код неверен");
                        break;
                }
            }
        }
        
        /// <summary>
        /// Заглушки для метода раскодирования различных алгоритмов получения кода и поиска объекта по базе
        /// </summary>
        /// <param name="code">Цифро-буквенный код</param>
        /// <returns>Найденный объект</returns>
       
        private static HeatObject ParseSimple(string code)
        {
            return new HeatObject()
            {
                objName = "SimpleObj",
                personalAccount = 468,
                registryDate = new DateTime(2018, 12, 1)
            };
        }

        private static HeatObject ParseHex(string code)
        {
            return new HeatObject()
            {
                objName = "HexObj",
                personalAccount = 5678,
                registryDate = new DateTime(2030, 6, 4)
            };
        }
    }

    
}
