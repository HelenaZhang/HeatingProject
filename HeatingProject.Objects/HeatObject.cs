using System;

namespace HeatingProject.Objects
{
    /// <summary>
    /// Класс объекта для генерации кода
    /// </summary>
    public class HeatObject
    {
        /// <summary>
        /// Наименование объекта теплопотребления
        /// </summary>
        public string objName { get; set; }
        /// <summary>
        /// Дата регистрации
        /// </summary>
        public DateTime registryDate { get; set; }
        /// <summary>
        /// Номер лицевого счета потребителя
        /// </summary>
        public ulong personalAccount { get; set; }
    }
}
