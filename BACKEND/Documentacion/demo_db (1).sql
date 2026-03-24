-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2026 at 10:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo_db`
--
CREATE DATABASE IF NOT EXISTS `demo_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `demo_db`;

-- --------------------------------------------------------

--
-- Table structure for table `auto`
--

DROP TABLE IF EXISTS `auto`;
CREATE TABLE `auto` (
  `id` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `placa` varchar(20) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `color` varchar(50) NOT NULL,
  `anio` int(11) NOT NULL,
  `user_create` int(11) NOT NULL,
  `user_update` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_update` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IdTipo` int(11) NOT NULL DEFAULT 1,
  `IdCombustible` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auto`
--

INSERT INTO `auto` (`id`, `id_marca`, `placa`, `modelo`, `color`, `anio`, `user_create`, `user_update`, `date_created`, `date_update`, `IdTipo`, `IdCombustible`) VALUES
(4, 4, 'GHI-789', 'Mustang', 'Azul', 2010, 1, NULL, '2026-02-28 17:29:27', '2026-02-28 22:27:52', 1, 1),
(5, 1, 'JKL-013', 'Yaris', 'Blanco', 2019, 1, NULL, '2026-02-28 17:29:27', '2026-02-28 22:59:25', 1, 1),
(6, 1, 'ADS-325', 'Corolla', 'Negro', 2026, 0, NULL, '2026-02-28 22:21:04', '2026-02-28 22:21:13', 1, 1),
(9, 1, 'ACS-232', 'Corolla', 'verde', 2026, 0, NULL, '2026-03-23 01:10:41', '2026-03-24 15:15:04', 1, 3),
(10, 3, 'GSI-342', 'Dio', 'Negro', 2019, 0, NULL, '2026-03-24 21:15:23', NULL, 3, 4),
(11, 5, 'EWS-414', 'Montana', 'Rojo', 2010, 0, NULL, '2026-03-24 21:23:52', NULL, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `autocombustible`
--

DROP TABLE IF EXISTS `autocombustible`;
CREATE TABLE `autocombustible` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `autocombustible`
--

INSERT INTO `autocombustible` (`Id`, `Descripcion`) VALUES
(1, 'Gasolina'),
(2, 'Diésel'),
(3, 'GNV'),
(4, 'Eléctrico');

-- --------------------------------------------------------

--
-- Table structure for table `autotipo`
--

DROP TABLE IF EXISTS `autotipo`;
CREATE TABLE `autotipo` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `autotipo`
--

INSERT INTO `autotipo` (`Id`, `Descripcion`) VALUES
(1, 'Sedán'),
(2, 'SUV'),
(3, 'Hatchback'),
(4, 'Pick-up');

-- --------------------------------------------------------

--
-- Table structure for table `auto_marca`
--

DROP TABLE IF EXISTS `auto_marca`;
CREATE TABLE `auto_marca` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `user_create` int(11) NOT NULL,
  `user_update` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_update` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auto_marca`
--

INSERT INTO `auto_marca` (`id`, `codigo`, `descripcion`, `user_create`, `user_update`, `date_created`, `date_update`) VALUES
(1, 'TOY', 'Toyota', 1, NULL, '2026-02-28 17:29:27', NULL),
(2, 'NIS', 'Nissan', 1, NULL, '2026-02-28 17:29:27', NULL),
(3, 'HON', 'Honda', 1, NULL, '2026-02-28 17:29:27', NULL),
(4, 'FOR', 'Ford', 1, NULL, '2026-02-28 17:29:27', NULL),
(5, 'CHE', 'Chevrolet', 1, NULL, '2026-02-28 17:29:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `registroerror`
--

DROP TABLE IF EXISTS `registroerror`;
CREATE TABLE `registroerror` (
  `Id` int(11) NOT NULL,
  `Mensaje` text NOT NULL,
  `Detalle` text DEFAULT NULL,
  `Ruta` varchar(255) DEFAULT NULL,
  `Fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registroerror`
--

INSERT INTO `registroerror` (`Id`, `Mensaje`, `Detalle`, `Ruta`, `Fecha`) VALUES
(1, '¡Este es un error forzado para probar el Middleware de Xtreme Performance!', '   at Mvc.Api.Controllers.ErrorTestController.ForzarError() in C:\\Users\\Usuario\\Downloads\\taller-crud\\BACKEND\\Mvc.Api\\Controllers\\ErrorTestController.cs:line 14\r\n   at lambda_method15(Closure, Object, Object[])\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Mvc.Api.Middlewares.ErrorMiddleware.InvokeAsync(HttpContext context, _demoContext dbContext) in C:\\Users\\Usuario\\Downloads\\taller-crud\\BACKEND\\Mvc.Api\\Middlewares\\ErrorMiddleware.cs:line 23', '/api/ErrorTest/forzar', '2026-03-22 18:40:31'),
(2, '¡Este es un error forzado para probar el Middleware de Xtreme Performance!', '   at Mvc.Api.Controllers.ErrorTestController.ForzarError() in C:\\Users\\Usuario\\Downloads\\taller-crud\\BACKEND\\Mvc.Api\\Controllers\\ErrorTestController.cs:line 14\r\n   at lambda_method15(Closure, Object, Object[])\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Mvc.Api.Middlewares.ErrorMiddleware.InvokeAsync(HttpContext context, _demoContext dbContext) in C:\\Users\\Usuario\\Downloads\\taller-crud\\BACKEND\\Mvc.Api\\Middlewares\\ErrorMiddleware.cs:line 23', '/api/ErrorTest/forzar', '2026-03-22 18:47:43'),
(3, '¡Este es un error de prueba para la rúbrica IDL-3!', '   at Mvc.Api.Controllers.AutoController.ForzarError() in C:\\Users\\Usuario\\Downloads\\taller-crud\\BACKEND\\Mvc.Api\\Controllers\\AutoController.cs:line 61\r\n   at lambda_method9(Closure, Object, Object[])\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Mvc.Api.Middlewares.ErrorMiddleware.InvokeAsync(HttpContext context, _demoContext dbContext) in C:\\Users\\Usuario\\Downloads\\taller-crud\\BACKEND\\Mvc.Api\\Middlewares\\ErrorMiddleware.cs:line 23', '/api/Auto/forzar-error', '2026-03-24 10:56:49'),
(4, '¡Este es un error de prueba para la rúbrica IDL-3!', '   at Mvc.Api.Controllers.AutoController.ForzarError() in C:\\Users\\Usuario\\Downloads\\taller-crud\\BACKEND\\Mvc.Api\\Controllers\\AutoController.cs:line 61\r\n   at lambda_method332(Closure, Object, Object[])\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Mvc.Api.Middlewares.ErrorMiddleware.InvokeAsync(HttpContext context, _demoContext dbContext) in C:\\Users\\Usuario\\Downloads\\taller-crud\\BACKEND\\Mvc.Api\\Middlewares\\ErrorMiddleware.cs:line 23', '/api/Auto/forzar-error', '2026-03-24 16:16:47');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `Id` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `NombreCompleto` varchar(100) NOT NULL,
  `Rol` varchar(20) NOT NULL DEFAULT 'Admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`Id`, `Username`, `Password`, `NombreCompleto`, `Rol`) VALUES
(1, 'admin', '123456', 'Lucciano Vivas', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_auto_marca` (`id_marca`);

--
-- Indexes for table `autocombustible`
--
ALTER TABLE `autocombustible`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `autotipo`
--
ALTER TABLE `autotipo`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `auto_marca`
--
ALTER TABLE `auto_marca`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registroerror`
--
ALTER TABLE `registroerror`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auto`
--
ALTER TABLE `auto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `autocombustible`
--
ALTER TABLE `autocombustible`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `autotipo`
--
ALTER TABLE `autotipo`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auto_marca`
--
ALTER TABLE `auto_marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `registroerror`
--
ALTER TABLE `registroerror`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auto`
--
ALTER TABLE `auto`
  ADD CONSTRAINT `fk_auto_marca` FOREIGN KEY (`id_marca`) REFERENCES `auto_marca` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
