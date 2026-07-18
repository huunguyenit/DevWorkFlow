<?xml version="1.0" encoding="utf-8"?>

<dir table="sms" code="action, sent" order="action, sent" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Gửi tin nhắn" e="Send Message"></title>
  <fields>
    <field name="userID" type="Int32" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="userName" disabled="true">
      <header v="Người sử dụng" e="User"></header>
    </field>
    <field name="userFullName" readOnly="true" disabled="true">
      <header v="" e=""></header>
    </field>
    <field name="content" rows="6" allowNulls="false" maxLength="512">
      <header v="Nội dung" e="Content"></header>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="120, 80, 330"/>
      <item value="111: [userName].Label, [userName], [userFullName]"/>
      <item value="1101: [content].Label, [content],  [userID]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7FjbqVzsZKEaIJ713el5O2EfFuJF9c8ZZkUAFr87ySU7NAIVxsXlVh8IduIHUa+bp+dh2LV4uMWHgzTJXeiINk=</encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6fMQ3LTJkpj2YMhHkL/I3QZ5cCtxuyGAzkuu245yRcwuj0aumjeQ8/gaaiYd/PLi6Fx7NpZJ7v9LpgRlmYkCBtbQVmfL5Ta3nyvtFei7qVfou/x0cycP61WnfvmkRbQVQe7TXgKXn1dbpIUB4Ek8o2krad121y8imEwlHku+CwpfznW+Cw+7ms1ir905NWNQBJU5nRly+u/fj+ml+3e1mnsYU/DkJ/bfXyAie+mDLZiC</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70DyrZ1Rsy3sXLy/XkNtxN7L35MbCCQcwuw9sl2sGA0U9IiN3ZgBp2QKqoegthuY6z8YnQ11knSDuqJgZrfYOWFn8QiGcccduXfaXGWbpe0PgwM0Hr/7Nf4PbYCEB8jBprq0nNDLJPc3GpvIADg1OsN0YF47I8A7P8vvxOBW/Bsx5psCaUwzPTsIkOBFd3sdJjgI5UN7xvjJhM+PqrRBri8aANIhsHz65EHeTT0jOlldW</encrypted>]]>
    </text>
  </script>
</dir>