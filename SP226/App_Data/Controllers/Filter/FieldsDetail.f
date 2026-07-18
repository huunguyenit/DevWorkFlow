<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "FieldsDetail">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;
]>

<dir table="freefunctions" code="id" order="id" database="Sys" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc dữ liệu" e="Filter Data"></title>

  <fields>
    <field name="id" allowNulls="false">
      <header v="Chức năng" e="Function"></header>
      <items style="AutoComplete" controller="FreeFunction" reference="description%l" key="status = '1'&Operation.And;&FieldsFilter;" check="&Operation.And;&FieldsFilter;" information="id$freefunctions.description%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdn0SRZxQAJ5jw+od5d40I3sIaHVU1II6iS1brWi0PXP4</Encrypted>]]></clientScript>
    </field>
    <field name="description%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="controller" readOnly="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="id_type" dataFormatString="1, 2, 3, 4, 9" clientDefault="1" defaultValue="1" align="right">
      <header v="Thông tin" e="Information"></header>
      <footer v="1 - Chi tiết, 2 - Thuế, 3 - Phí ngân hàng, 4 - Thông tin chung, 9 - Khác" e="1 - Detail, 2 - Tax, 3 - Charge, 4 - General, 9 - Other"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L8XkVeVwyQ21YM+SQquZEo4IEuWiM1GaO9dCXywKtSyg</Encrypted>]]></clientScript>
    </field>
    <field name="tax" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="groupby_type" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0, 0"/>
      <item value="110101: [id].Label, [id], [description%l], [controller]"/>
      <item value="111001: [id_type].Label, [id_type], [id_type].Description, [tax], [groupby_type]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp+Rm2z/HOqmKI5Xh9MvFMhAPQRs2APmziiTnmobi/f5+KyDiJ9l9D2wpx89KWQG33EOQmIgP/o7jeEK5E+7K0VWWbV1RdUysvHxqjbDLqEOqUO0fLS0s9EQ20wjMDH4Fbs5R9ggsn4h7+k4FBNpWBUD47Lv6Bs6IZ8EfwhpwoC7/yrb+4qmQAc+sIwQ92yyJha6gWWA7mZ2CBUw+jgxuPgCEDH5xdGPa5vXsGdc6JojVmvny8FFrXeVyMpvh40KwHQiiX6oP0FqDpJYSmKjk+Z0cODKomaPbnJbJ3YsHkBMmw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdkWF4iAo1/cjEhK5pkbvWkOjkCq7M5Ymx5M937u2XsF5xn7BISHsKgX9NvMWYmkDSA==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdkWF4iAo1/cjEhK5pkbvWkOjkCq7M5Ymx5M937u2XsF5xn7BISHsKgX9NvMWYmkDSA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdjJ6ORpkOCfCYWsximqnZ96Z9Y/v9LutdwNdyBLdERuWahNpjmXX9VKTFKCaGS8pFA3Vb17obw/01lq789REWVhxe97qL0xjGGwpuuWV1G6ksNLzzopxFZcOZjikz9xpfwoF73g65hz+QaAOSEJ51a4enGEfBZ8iv4yG+dxI0vZjy2O4ni3idDaqQJ34bgJY3yrdzVxNeWejrpS2Ycm9TJw=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdgRBUOITu478N0ZnR8wg56M6eKo42PJdr+fMbqWFuKG7c45zZ2xBXWRZThA/0syIaEpAHgk9Aa7GOQWk+dfoUjkmeeUwInyYCyOI+E3bs/znbk+6Fhn0wWJdCQjG5qZnVw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxduAiwMOclQCVHN4EOesx5HFZb4T3rE3cQnU4F9LbUG2a7EyZJyM8vlR0lwZji+3ifX7TeIFoI1aOBtBTpy44oIq8g/T7ond8VIMl/GFkA2HP</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L4eFbAhdC/pNc4nXJ6OFEqg6PObdLZ5fYJJUxRcszeQXbERlyvlbLFC+8RM1QEYm4hSeidhUCuE8l4CF2DJ33PAbvi5d9OILNdP8XVAQT5NhuwZGI4VUsyWzyH6cp7BUIlRpvT3KFH81yqpZ6ywFcq/KQau8AFBeVqKmHWuPBlyfMU3eB3EKLrGuZHLVMjeskcVB+nH148eeoYB0za3sO9TxoDyV77RcJG/a30nLeSygpKMj5Ff4tN525HdLvGR2bacA7pyRmKrfFYi403QEDsbeZMgkwHTaJegjvdTwQEZ6V92YbqrfpDNshVSaU6IRFa2gefBJ/X0RHwKAPfoAmUR2eQAGkoEEzfgouNBvVBGIqUnJgLcXlBP2U8G3zIH6HE+syXgzhRlq0nbQYUNo4FGnHZb0DqPNGO2pw5hjl5X0BA/1qNCFhIPMmjF5SVQM8cRgv5U55QBR21DvuYYAv9lKX9kenEIUofFldCOsM487j/7n8/VBwFAlvqZ4p3T3h14Y30xjKs0gwtarFhsE4XYo+MfBYmAYjm6uumfYHrlRkNeUF/tUHtRIDBhoNcdvLrU+UJsVTnXYbYPO6TsgBgTUFX6+DW56pUalS8Zh+aWI4hsPi0TdLTSyfOKznevMqEQaqlqbwF+6btJD//T478NkxiTtz898RgBdKMvzJQS1DZ63Fx1KIeWrUSm28U1JRvsl+/qNJkVelPLbHSgnUKUNM3DBLC1frg2BJH2WafSan4VrWJGfC1pScXTwRowzbu9/FT4DEwR7J2j/d6NPMK3BN8hDJYmqQeu9QqF5No/BrmLwFjaiSrcWG+gTMLOMhA+zO9t6sOwSwhbd0p2nVBVACslAkT93ea/BGs5jbgV+vdDvgUpK2GrIq3vqOlf7FcMfiI9g8n4UlFVd21HcB36rbUiDSU+DlxJNflQP2i8vzaxx35uMFIaI6t1Av3pWNjWVLC2fDPVpb8v5aJprXLY0BbC78Ofr9tcmf+e+RmYHZVkhD3WmKekGKSFbofYDwRaF7HAQsambJ+kn/dJV9Hhl19MU/GKpmbFs9aW04lTKUuX95Q+PH8fnho2EIlji8M7yIMADqHx3qTD51RgvF0w=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L/cNIOM/0jrWDtWkIY1kxtIXsdQ+Z776TopNWBM99u4i1J8tK3zul5HiZOATzMefjZAR6vMCD20h9fOh8A8NKRPHPyVGSjBx+bfujYcR6r6/o++jtgB5azuPuemQEiXw1LhjzEZnJ0FVrYte+i++zSKtQKGLz3iS2xYONFKIsU8izo79N3hy+cf4+tcv5rE7GTHO9zYGLX/tvSyyhHQA8LA4uBjQ6+X8qVOhh9ekLIKchFEA0Iiy3u3gKGGM2+Q9Vg==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Function">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4axea3rs9GcwsMhUWTvo9n752TJ9xCf59seUxTontXmCXbZqwY+hgnlrMLYo1xKI+VYiQCTIkN0rC37tsbfzyXuwWaAjQ364iwbtZc2WKhxLE9JHofcHqxcT5J967HR2SGY/m9wKkRP2YjsZO2W08ZnKJnBW5D44eb7+mb4dLJCXkgnM9uMipLALOR17nVlAU=</Encrypted>]]>
      </text>
    </action>
  </response>

</dir>