using System;
using System.Web.Mvc;
using HeatingProject.Objects;
using HeatObjectCodeClassLibrary;

namespace HeatingProject.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult GetCode()
        {
            ViewBag.Message = "Получение кода";
            return View();
        }

        [HttpPost]
        public ActionResult GetCode(FormCollection codeCollection)
        {
            DateTime date;
            ulong account;
            if (!DateTime.TryParse(ViewBag.RegDate = codeCollection["regDate"], out date))
            {
                ViewBag.Answer = "Неправильная дата";
                return View();
            }

            if (!ulong.TryParse(ViewBag.PersAcc = codeCollection["persAcc"], out account))
            {
                ViewBag.Answer = "Счет должен быть целым числом!";
                return View();
            }

            var heatObj = new HeatObject()
            {
                objName = ViewBag.ObjName = codeCollection["objName"],
                personalAccount = account,
                registryDate = date
            };

            try
            {
                switch (codeCollection["algoType"])
                {
                    case "Simple":
                        ViewBag.Answer = HeatObjectCodeGenerator.GetSimpleCode(heatObj);
                        break;
                    case "Hex":
                        ViewBag.Answer = HeatObjectCodeGenerator.GetHexCode(heatObj);
                        break;
                    default:
                        ViewBag.Answer = "Ошибка!";
                        break;
                }
            }
            catch (Exception ex)
            {
                ViewBag.Answer = ex.Message;
            }

            return View();
        }

        [HttpGet]
        public ActionResult ParseCode()
        {
            ViewBag.Message = "Поиск по коду";
            return View();
        }

        [HttpPost]
        public ActionResult ParseCode(FormCollection codeCollection)
        {
            HeatObject heatObj = null;
            try
            {
                heatObj = HeatObjectCodeParser.ParseCode(ViewBag.Code = codeCollection["code"]);
            }
            catch (Exception ex)
            {
                ViewBag.AnswerText = ex.Message;
            }

            if (heatObj != null) ViewBag.AnswerText = $"Наименование объекта: {heatObj.objName}\nДата регистрации: {heatObj.registryDate:dd.MM.yyyy}\nЛицевой счет: {heatObj.personalAccount}";
            else ViewBag.AnswerText = "Ошибка!";

            return View();
        }
    }
}