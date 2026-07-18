<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Gửi phiếu lương qua thư điện tử" e="Payslip Emailing"></title>
  <subTitle v="Kỳ %p năm %y..." e="Period %p Year %y..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten" width="150" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Họ và tên" e="Full Name"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="email" width="150" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Thư điện tử (Email)" e="Email"></header>
    </field>
    <field name="status_name" width="150" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Trạng thái" e="Status"></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ma_bp"/>
      <field name="ten_bp"/>
      <field name="email"/>
      <field name="status_name"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL755u2xcm+ZIPR2yjQaCrpFediiV1f7we7zXVySD7VYofePQokWSethRAf38MlgREipn4605eBMJImgjVcX0PABHFBqrn2mkVisrY5AHdjX3tW</Encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75ymtyW99MDOuhUekZt9uT78ikk9b1xhrsXTzfCswY+SnbvrIz671oYMgyYnTPfuMCKzOZP1qQjwtmRd+NOBvMmg=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8iPaG86vSLQtOIrnsmFxh2G+2UhsQJ6hXc/CvJMtkFs7/BhD0kOX5TluRI80/1yibc3zZr+Tz4QbKNOxHQxDlPR</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fyZ7FSJOd5E836kG5vLjWEQ5erV5ptg3kw8JsaNRFgMFGVlfW2gmHAsmqG7huMjKh8juWzB7aA6FIUIcZm+Rnel/gYwcojzE5eCB5B5ACuWYUIZEKT64+aAQs8s2TeDmDMAxyAtmuggaXOC9/0Iuvmp/mvy2IgcGWfCkRqQl/yTOnWIFErkVAwutaRGPUUWw4Xh6ciYdAdAkTUhyTDt9zacmPY7X/LTysfewcCvYr+9XqZ1zaKrWn9CVh4ZBzxbrGqnUtyWTZMXylQUYFa+EUs067MShsmKAxVIt1504jWu7yBzeEQu7BGx1EuEajTtenSi/k75xqKlzAJfjR3kcvPd76RNG8KY8jaHI8eae2PgGtPOxO8aE9KTt/adoaRRdo5ORtfvAzHSgWXIz0OE0d5YvtyO1EW5I+08IeB8XpZGpSvHQ4gkUNEJu4eXWbAW0rIEiYfrpssIaj7Tiq3b3xdVj/tUhCP7WlUZflwII+nGatOn0HeFZpaGwE1JEPkIPcayzPiPX61O2Dvkbj6qD1VZDQmlIxX0khanL9U9a2UM9zaOI5gNTJCd/PKl6nRH2Q==</Encrypted>]]>
      &JavascriptReportInit;
      &ScriptTagReport;
    </text>
  </script>


  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7w0elUedl1NmScVo2HwmcSAjjjjqu+m+olHtz5tTo/6p+6VBdqF/683GUEQUPdgsOV7CR6MvkU7YzhZUF7Ihzd615LhKmnfLoVlgRSOKUnRGZfhozfEJ3w9y0EfgQmT6fV1QpLXKoXalkIFXTVaxFuFe/xzVl0nsbDdzOaLYmbW37STf7QHvwUifxJMqvQ3z7bbNi44DdCH+bg6+n50LrE6WFvXCqmrDeC9xgZMBHlbcIL0gJFcADmDQzueB0x4sw==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Email">
      <title v="Gửi thư (Email)$Gửi thư điện tử$90 " e="Send Email$$90"></title>
    </button>
    <button command="Cancel">
      <title v="Hủy$" e="Cancel$"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>