<?xml version="1.0" encoding="utf-8"?>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn ngày làm việc" e="Select Working Date"></title>
  <fields>
    <field name="date_start" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="StartDate">
      <header v="Từ ngày" e="Date From"></header>
      <footer v="Ngày làm việc từ/đến" e="Date from/to"></footer>
    </field>
    <field name="date_end" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="EndDate">
      <header v="Đến ngày" e="Date to"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="1101: [date_start].Description, [date_start], [date_end]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvlKXFYGbOGMoyD3iZ3F5ID+KhG5x2D+kdjfTqM2wiKxlKpxxgQXxiBuvY63F2iLie4PV07REVKNTGj3ajRgSYMClS0NbZ9aMkRPqsppotcNQXdEIH0yPGU3VU1fPogvnJfNcDbxJP4fr7bAlYEBP2ar1dO34OH5f2t2ypSKVyE7LA9EWYqJKSRlXr5D7Rj+lgYNYUysPIkWpOr4f5qcgx0K+rBfsE5ls4IYNXRSi2riRR9bhMyB2gL0vhKaMPJBwwKSE4CcVfCe9FHTQfToXQ3nV/oyMo7x6CIfWallo6O46WR1canoA+KzLV+69gbYZnxUj6dZ8t7wG2O+gwIwA5fcItakTaUrgA3ZR9rIDVLOeQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSxUTjSdwpeFyDkTvWrtBCDIiDyuAFv3CzPpndntIo/iBDOx/7+KkT3ZFTJUXnqA+yH8XR3F2UXhwIwbQHZJDE=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VpOl8B4bDK3wl9vLcZytMvuac1ZA8K0+Joatpsa97KSMFW7odMqqEuAPYtEn6aRY/Tq505/yXMzDWG2wZsNd36VGedQb++6nM9BnHJK6Sqv</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9wHoYOG1InoWIeitUAOMfPH8JZXybqKCtb4LuSUof9k8mL8S7+Bhn6Mz9epnUSIXbOZ9FCz6wXFO9UjncU/HYDR0+nXs6rmMbL0N6Mm4g54XOnHQVIEnBhoKMNWWCXC7Ll0exMiZZpj9Ff1puMX/6mop5zmytIh7TKnZBwpGv4yNbN9rbs7lO6GN0tzVQQnLZkNJ1ibNLtafZTby2XUwgQk/x83/u37oJGSR6c37f9cjUJxesbG0miknFmBR3fCCKvEx4IAGl/11uIungBgxdrVrX8+QFfl8XR1QS4gO1YqiEftIY/9/wcFnOyShNyVsmSw/QnTlyr3BRVFir1mOZbLDCYIl65KdUBq9TMK/og/ax/Hl1O12+7BSUGxgWulHy1b85IXKuEynlNbdCPVUglYa8P3dyqK2ZtizS5k2AIF2MFYtiKp2GXrs9sa5Hjrq9yj7OS/wtP4Nxm587/CCeL1xyotBrg3UzHkYjosp8gRQg/OsH9l6PJAl7Im9dUDSYKj1oiEqBRNvQv0cBehADXLa4LQFxYtxkZBlFDE08ksC7FQfdqujnx1cDLuGKVZmNm/jx3jNXz75HlWQKr4nK60hZwa+DCDfQg9GT5SaDlMXH6XOmEz6lKEBjVywP+BwMYE/vkjFnEVrEdY3DhsKzjM</Encrypted>]]>
    </text>
  </script>
</dir>