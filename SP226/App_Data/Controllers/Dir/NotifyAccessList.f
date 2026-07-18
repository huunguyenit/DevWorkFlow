<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmquyentb" code="ma_quyen" order="ma_quyen" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quyền" e="Access Right"></title>
  <fields>
    <field name="ma_quyen" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã quyền" e="Access Right"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_quyen" allowNulls="false">
      <header v="Tên quyền" e="Description"></header>
    </field>
    <field name="ten_quyen2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ds_tb" allowNulls="false">
      <header v="Ds mẫu báo cáo" e="Report Template List"></header>
      <items style="Lookup" controller="PeriodicReportTemplate" key="status = '1'" check="1=1" information="ma_tb$dmthongbao.ten_tb%l"/>
    </field>
    <field name="ma_dvcs" dataFormatString="@upperCaseFormat">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="sms" type="Boolean" defaultValue="cast(0 as bit)">
      <header v="Gửi tin nhắn" e="Send Message"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

    <field name="nguon_dl" inactivate="true">
      <header v="" e=""></header>
    </field>
  </fields>
  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="110---1: [ma_quyen].Label, [ma_quyen], [nguon_dl]"/>
      <item value="1100000: [ten_quyen].Label, [ten_quyen]"/>
      <item value="1100000: [ten_quyen2].Label, [ten_quyen2]"/>
      <item value="11000--: [ds_tb].Label, [ds_tb]"/>
      <item value="11000--: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11-----: [sms].Label, [sms]"/>
      <item value="1110000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIXJw+y6RDyH7TGtu639WBSpXbF3/34KCjrM5joMRflpgL/suZLbZRztDH3SKlmCRYxNCKj1O6vw0e+spTmssis=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHmttEt3N+Un1w4Vt8hY+oRATNkRR30FCJ3EylT/RaNvxyk+rQ1ZdwR5pcNN/F4EtFnTPt0lIrnuIZwJkMunh1M=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVmI4cGRXvyL3QejXiZ0iO/Ub22mDVBXi1aT/mSavVpyFksatGQSeYLwtIgl4w+8ylcjzFaA+5I6nLtRywKdH9aduFJv7/4nL3Ett8Ir5Or0e97HeFGDF597ugJKr508rWopno63ZauAkzCj2srH2NCJE8/27kTzSmz2qpo4XULqh5nO19Oum3iEIp8W7uMGBJfo9u/NndHyOXdcN3tqPytDsNcqDs5m8xUux3VmtEvtmvXQp+9miVJbYiCrQQJDS7bj+7JxArJT+hDaSqk+nvBtKiUwWXYUYMlTv0Kj11gEsD+voH7tt73DdxPjti5O4wXvAwPEc+Za3sERzQC+YH70Rx/CUv5LFgo6vendJzS3Hkhm+/0BeOD7y6rP/54EHAHaQe+KGgiNBLIvegYCTpdVgLRszhj2Cfbi307o3sX0mVPT30DNFdQaubSQ1dbTyB3iODy7zlg1RM2cWjSVqiFShFC/4cqgJRPO9V8+abR47gzOVZ6vf9odLz+48bLWE6bBe2uIZ/HoTK/s+MpLbVMQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dXN3KY1ES2Y9QbPT55KJ1ZdLJfs2+hgyzpf3Q6OZN5baDAEISpWILPQXfvV9rd+bmI5UA7opgtEyomZDTaChGyLoIfAVD1v8GfRqutltWe3kib3slbhPcEjVltp2hKwfuPGmIb7a8DNi6ADsnRdkiQ+79kw1G4PbaeIikpc1+dqKYOj1eLUypWp6cqSvrC8aiyuQx1DrqKCacuPhtJ3ioTlHus+bGMbo8wZ/xuuztWzs9wKCRFT67+gIrRKtnbTi4GmezjwxFdoWa0L7Nhl5E7sdqH1/ylllygxlltyNjsLuOFwCcpYHamwLqKj09Dv3FRtPZljJScsKeK8UqZTan5aNMLWu9DbqrDEXJkICIt8LRLiO4pp5lHlAFOyVe7I/pU=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dXN3KY1ES2Y9QbPT55KJ1Zd3AuTbIw87wntlWC+CvR3SPvSCq3ZD3l/WJKUg0mfC2AlAXn55XKd9yXv4yIBJIZPmTXYiEkMvuMAoxtn4rOVhXFsdHI5hu5FHy1ZJfCp4vqsFtMkXYj8KEY29pdAjImR7OTXZc1QAD0hli9oYviKUduF6YLLHz1WU/fTeP6PPQjuooI0rqG9bRauAxCekkpQQjcP+Iz4Yxry5jfaWqeHnUbRIgrhhzcfX7OuC5JXv+t+or8seA9cBMjKNh8qQN4xz+egQP0FkKWwIJA9WbFrseWmd+UiHLaffQZNP4dAe3TZIDe2gEJ1r+F0EUf4wh5HGMbOUJaGd/jUXUvVie2QFQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxobMYXYf2XzMJhnGF4ry1QNJgkUECuaIoO6sYnuriVJzTA4o9+FwCngXVf8KKuQqJ1AVx9Bzal6gz3AyQdSmTskv1yKiA8H9ru41p/Z5xrvnXK2Oj/uCk+iFMAPeqNnaRJJRn0ut4o4WOXlo72lkW1ccJuWEJ0m7AA9gieNj4R8M5+KJa6QcgsBlxGOOnclLBZBUf+knYvSBhc7RFzv33Q=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dXN3KY1ES2Y9QbPT55KJ1ZdLJfs2+hgyzpf3Q6OZN5baIIVBmQqm9+PM1D2MoUakWsmC54x6S5Rm+kLVfjG5kyHFVMqxf0nRwz3sf7NBj3FaXN+VPsA/19Jc84sftSconBwhtaUAZpJAyFdO6UxgmZKTj9NyugQt1ig/kMHTULJNfiBHHtgIUMRWw6pfc56wa0=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdCZ0og3+rn/xGOd9dNjdte1BP1WE/8Zc/JXyBrVSOrCXLhufQkpVVk8JWub+f+GnqhW5oD2lFzZ+zXSJYBV73TnztYwV4qbQJ7jIDL3/EKJk60q+Fuo56KTbLlHmHqSWd82MYQ+z/DtLjfCwa17CW6XIqLpgO68RkwAwfG2G2wS4EizdRC5arr0obQyXENFa/tVTmCqQjB7JAnaCgSdwchTIwZZq9VbWAqd7i+fG1ldxBA0ulqGeTvLpPp3+Yq3vYzcn8brunxpANWWKj2wmVL4MHNo0VzSNpY+r53DGlAj</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>