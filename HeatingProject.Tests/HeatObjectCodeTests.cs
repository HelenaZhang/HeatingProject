namespace HeatingProject.Tests
{
    using System;
    using Xunit;

    using Objects;
    using HeatObjectCodeClassLibrary;

    /// <remarks>
    /// Для упрощения в одном тесте проверяются оба алгоритма
    /// </remarks>>
    public class HeatObjectCodeTests
    {
        /// <summary>
        /// Простой правильный тест с коротким именем и номером
        /// </summary>
        [Fact]
        public void TestGetCode_CorrectSimple()
        {
            //Arrange
            var heatObj = new HeatObject()
            {
                objName = "ОТ123",
                personalAccount = 156,
                registryDate = new DateTime(2019, 10, 1)
            };
            var expectedCodeS = "S011019ОТ123-156";
            var expectedCodeH = "HОТ123-156-3FB";

            //Act
            var actualCode = HeatObjectCodeGenerator.GetSimpleCode(heatObj);
            var actualCode2 = HeatObjectCodeGenerator.GetHexCode(heatObj);

            //Assert
            Assert.Equal(expectedCodeS, actualCode);
            Assert.Equal(expectedCodeH, actualCode2);
        }

        /// <summary>
        /// Тест на дефолтные значения даты (01.01.01) и ulong (0)
        /// Также это тест на минимальные значения
        /// </summary>
        [Fact]
        public void TestGetCode_CorrectDefaultDateAndInt()
        {
            //Arrange
            var heatObj = new HeatObject()
            {
                objName = "ОТ1"
            };
            var expectedCodeS = "S010101ОТ1-0";
            var expectedCodeH = "HОТ1-0-65";

            //Act
            var actualCodeS = HeatObjectCodeGenerator.GetSimpleCode(heatObj);
            var actualCodeH = HeatObjectCodeGenerator.GetHexCode(heatObj);

            //Assert
            Assert.Equal(expectedCodeS, actualCodeS);
            Assert.Equal(expectedCodeH, actualCodeH);
        }

        /// <summary>
        /// Тест на длинное имя (больше 18 символов)
        /// </summary>
        [Fact]
        public void TestGetSimpleCode_CorrectLongName()
        {
            //Arrange
            var heatObj = new HeatObject()
            {
                objName = "ThisIsLongObjectName",
                personalAccount = 590,
                registryDate = new DateTime(2019, 01, 31)
            };
            var expectedCodeS = "S310119ThisIsLongO";
            var expectedCodeH = "HThisIs-590-77";

            //Act
            var actualCodeS = HeatObjectCodeGenerator.GetSimpleCode(heatObj);
            var actualCodeH = HeatObjectCodeGenerator.GetHexCode(heatObj);

            //Assert
            Assert.Equal(expectedCodeS, actualCodeS);
            Assert.Equal(expectedCodeH, actualCodeH);
        }

        /// <summary>
        /// Тест на длинное число-счет (максимальное значение)
        /// </summary>
        [Fact]
        public void TestGetSimpleCode_CorrectLongAccount()
        {
            //Arrange
            var heatObj = new HeatObject()
            {
                objName = "Obj34",
                personalAccount = ulong.MaxValue,
                registryDate = new DateTime(2020, 01, 01)
            };
            string codeUlong = ulong.MaxValue.ToString();

            //MaxValue теоретически может меняться, поэтому пусть так
            var expectedCodeS = $"S010120Obj34-{codeUlong}".Remove(HeatObjectCodeGenerator.maxCountOfDigits);
            var expectedCodeH = $"HObj34-{codeUlong.Remove(HeatObjectCodeGenerator.maxNameHexLength)}-78";

            //Act
            var actualCodeS = HeatObjectCodeGenerator.GetSimpleCode(heatObj);
            var actualCodeH = HeatObjectCodeGenerator.GetHexCode(heatObj);

            //Assert
            Assert.Equal(expectedCodeS, actualCodeS);
            Assert.Equal(expectedCodeH, actualCodeH);
        }

        /// <summary>
        /// Тест на длинное число-счет (максимальное значение) и длинное имя
        /// </summary>
        [Fact]
        public void TestGetSimpleCode_CorrectLongBoth()
        {
            //Arrange
            var heatObj = new HeatObject()
            {
                objName = "LooooooooooooooooooongName",
                personalAccount = ulong.MaxValue,
                registryDate = new DateTime(2020, 01, 01)
            };
            string codeUlong = ulong.MaxValue.ToString();

            var expectedCodeS = "S010120Loooooooooo";
            var expectedCodeH = $"HLooooo-{codeUlong.Remove(HeatObjectCodeGenerator.maxNameHexLength)}-78";

            //Act
            var actualCodeS = HeatObjectCodeGenerator.GetSimpleCode(heatObj);
            var actualCodeH = HeatObjectCodeGenerator.GetHexCode(heatObj);

            //Assert
            Assert.Equal(expectedCodeS, actualCodeS);
            Assert.Equal(expectedCodeH, actualCodeH);
        }

        /// <summary>
        /// Тест на максимальную дату (31.12.9999)
        /// </summary>
        [Fact]
        public void TestGetSimpleCode_CorrectMaxDate()
        {
            //Arrange
            var heatObj = new HeatObject()
            {
                objName = "HO09",
                personalAccount = 45,
                registryDate = DateTime.MaxValue
            };

            var expectedCodeS = "S311299HO09-45";
            var expectedCodeH = "HHO09-45-513";

            //Act
            var actualCodeS = HeatObjectCodeGenerator.GetSimpleCode(heatObj);
            var actualCodeH = HeatObjectCodeGenerator.GetHexCode(heatObj);

            //Assert
            Assert.Equal(expectedCodeS, actualCodeS);
            Assert.Equal(expectedCodeH, actualCodeH);
        }

        /// <summary>
        /// Тест на null в имени
        /// </summary>
        [Fact]
        public void TestGetSimpleCode_IncorrectNameNull()
        {
            //Arrange
            var heatObj = new HeatObject()
            {
                objName = null,
                personalAccount = 12345,
                registryDate = new DateTime(2014, 3, 4)
            };

            //Act
            var actualExS = Assert.Throws<ArgumentNullException>(() => HeatObjectCodeGenerator.GetSimpleCode(heatObj));
            var actualExH = Assert.Throws<ArgumentNullException>(() => HeatObjectCodeGenerator.GetHexCode(heatObj));

            //Assert
            Assert.Contains("Наименование объекта не может быть пусто", actualExS.Message);
            Assert.Contains("Наименование объекта не может быть пусто", actualExH.Message);
        }

        /// <summary>
        /// Тест на пустую строку в имени
        /// </summary>
        [Fact]
        public void TestGetSimpleCode_IncorrectNameEmpty()
        {
            //Arrange
            var heatObj = new HeatObject()
            {
                objName = String.Empty,
                personalAccount = 12345,
                registryDate = new DateTime(2014, 3, 4)
            };

            //Act
            var actualExS = Assert.Throws<ArgumentNullException>(() => HeatObjectCodeGenerator.GetSimpleCode(heatObj));
            var actualExH = Assert.Throws<ArgumentNullException>(() => HeatObjectCodeGenerator.GetHexCode(heatObj));

            //Assert
            Assert.Contains("Наименование объекта не может быть пусто", actualExS.Message);
            Assert.Contains("Наименование объекта не может быть пусто", actualExH.Message);
        }
    }
}