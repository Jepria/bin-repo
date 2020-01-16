Кастомизированная версия swagger-ui.

Кастомизация заключается в создании сервлета index.html.jsp из клона оригинального файла index.html.

Сервлет index.html.jsp позволяет упрощённо встраивать swagger в jepria-приложения.

Пример встраивания сервлета в приложение (web.xml):

<web-app>
  ...
  <servlet>
    <servlet-name>ApiDocs</servlet-name>
    <servlet-class>org.jepria.swagger.SpecServlet</servlet-class>
    <init-param>
      <!-- Путь к корневой папке со swagger-ui-ресурсами в веб-приложении -->
      <param-name>swagger-ui-root-path</param-name>
      <param-value>/swagger-ui</param-value>
    </init-param>
    <init-param>
      <!-- Путь к корневой папке со spec-ресурсами в веб-приложении -->
      <param-name>spec-root-path</param-name>
      <param-value>/WEB-INF/api-spec</param-value>
    </init-param>
    <init-param>
      <!-- Корневой (общий) URL-маппинг REST-сервисов в виде /*, соответствующий значению servlet-mapping/url-pattern Rest-сервлета -->
      <param-name>api-servlet-path</param-name>
      <param-value>/api</param-value>
    </init-param>
  </servlet>
  <servlet-mapping>
    <servlet-name>ApiDocs</servlet-name>
    <url-pattern>/api-docs/*</url-pattern>
  </servlet-mapping>
</web-app>
