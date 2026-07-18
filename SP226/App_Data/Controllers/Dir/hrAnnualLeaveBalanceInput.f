<?xml version="1.0" encoding="utf-8"?>

<dir table="hrphepnam" code="nam, stt_rec" order="nam, stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="cập nhật số dư phép" e="Annual Leave Balance Input"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nam" isPrimaryKey="true" hidden="true" type="Decimal" dataFormatString="###0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfKbdm0qXW2jpUdZxoCpAv1PoQ7DBBfeLNDTnZZHO18o5I4t2rsMunbs/OPt0jLTifmP2yLemWZLnPZfbkTqGDc=</encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_phep" type="Decimal" dataFormatString="##0.00" align="right">
      <header v="Số ngày" e="Annual Leave"></header>
      <items style="Numeric"/>
    </field>
    <field name="da_nghi" type="Decimal" dataFormatString="##0.00" align="right">
      <header v="Đã nghỉ" e="Used Annual Leave"></header>
      <items style="Numeric"/>
    </field>
    <field name="loai" dataFormatString="0, 1" clientDefault="0" align="right" allowNulls="false">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Ghi đè khi chuyển phép từ năm trước, 0 - Không" e="1 - Overwritten by Previous Year Balance, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0, 0"/>
      <item value="1101011: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec], [nam]"/>
      <item value="110---: [so_phep].Label, [so_phep]"/>
      <item value="110---: [da_nghi].Label, [da_nghi]"/>
      <item value="111000: [loai].Label, [loai], [loai].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6Iua5WMYZhx30fA/aRZ1aF9U+mYR2z1z9c4KTz3lhalHSL+6jxNrJS1A+cTxMu2c/TieIrQQJHpWOBT0MujcPwGIa3dqmDxbUMpbfLdrj9</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxcLSs+Y3hfyYu0oHiKsije6hKnqPSisQn1hR0i35S4dSR1nHmyEhn63XZXIrkxxfGIeMxll2dZE9QG7+89aCJRXQOBe+pIh5VVmnDeR345U</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7DR7t7IPI6HPdEAdPBI8TVj3zVOagj9Xr+JmjNEKAkbXIbCc3kbyxLlkwawWRaAr5d3FrLRID97jGzuWyIChLRFsXRzkKTQ16Ba580Wp8+I</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TLfoWKwwcQ/O7FyNadU2tk1CUaqVq1aM8LqGcoVzj0zCGhcc+UWrIUk8TFYAscunj2k/01lWOaKl3CrePVFnqtcTjVKMchOPj4UYvW77m9s0tz9DJh0HEmIXcRcZG19qyyjtlZ7t+70+PVZCgWjZcu0GmF04jikhVd8MNwLfDLcoKqj2Y0WOTw0V5kgfN+3jA==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtRa/LovLRF7BI5fDpOp0/cvKmxZaA0Va6EHRAisY3KwN7PMe3UafzKza6bEdP872w5tThnjnLPgYh0Hj9q/wDiotz6CaU/qmyjZ78kyHR+mQoGdNMFctl6iQ9p24mLHwEycJvDGbyvGVEgRoTNwZ5Yq3wy7Jn5JaNmtJbyWb96dxvTyC9nR+obdWLna3NC1F5UgSAwoBccTAg2I5nbv9wG43As+2rNCmqSjFGiPtjuVh2e02Cqa7qTnY5PlIxxt4hCL4DR5Ifm9ZK1Dhlijd/uhBjVusgfLMH5sDaglXsd7BjlMvf8BVEvJSJz7w4cDNWM3j9bl74tFjz+rJ4zPq8q1eImPFaf/9FYkHwTS0nn4blIF4kUKd8W4IDOnFIyTc4w==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n0ob5zXQy72Mi8+VsqJ5Q28HsMqHtWRFmInLlqsi5eVTna7P4zM4IUPRljuJ9bOq7rOJycXkKr7Gh7ET1u9MtZEZLTJSRn7zB8FnlHXRzDtdqUCQ/vSUXomPONhlmkuS99fznn/6Dj6HAMzdOsdZ3oS3tyGMM1Oj7XCFEJx+oS8Y/MOl/bpA2gA2RPN7paIiP</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%cuXNkLI/9J0no/A5pPbabpf0AQyetWdN/zNcTpAiAHT2kbCElDjMUH1JWlOzbX4nlTbcqyQdTcvFPuJaQeCORb8B5ruBudxNW8sYXqycRf5ui5SBkc25dlOM1b5YOI+IIk+SjTKXEG9Dj/FbDgP7rG3Aekih0VaZAeLiJcCWJPrYgVmhk86ERVvvpiWCoFFYkN5Ywc3+9cBjXRApMBSJrJvph1awK5M6KJY/NbZEVyDFJ183mb4q+00qZ8jjm2NUiWxpoInM9d6EBD/ZP3g7t1NMdWoiQEItaTHSEsutju0qOjnLgeZwB57fHJIpk7Tz</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeifCRlnmuX3C5qSLhjIsQr6U13+jTaWrgwrJB5AHhR1E7TWcGg/VlmjFhntc1fD8/g==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70K7lDT9ImvPSKg2ert0dcw4avwHoU01SsJlbI9Jo8X9zxI7b8X4x+T0FZV2xfhHNqFnJHHNPfBxaUPWlexAUBUCpw7YmVzkln6BExV//j/t33Ct9aXg07ZDW2K/VMVsBrWrMTNrRQfMb3tY/J3mltVu3P33ewrmGxTSu72Ce+yL57aukv/JKkoXAGgkD66MfrJZdwmWUggvqY0bleR50bCh9qKSGOqza9x4RCU4RwWUG+4GzOLnaz6c5uVE2gZWMQxyR5VlsE4QuvkjVrdM2rGMiDgVOxTTg/yYa2rlU/ObeYvE1fXOZbVzVBexCaWIhuLzTeqyLD13JvRanfpCiiW5HVOptXaIG9EKX01SdY58rOvlCCjnB+9O4bYkb5V/6MIUjL+L/xTbC7KPQaFeS6V1a0kwqjtMXWElBBi+TWa/LCA+Dg62ZkhIsV5lrREFQ3HU9/rp0vMEV9exwHCv3Yg9ffWR1aoNJxo/PVP9KFYez</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="IDNumber">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6Wdyk9aPi/fGimY6rlT0N8nVAGzan76LcTwu5Z5TgGNe1NWZAFthZQVFXCS3ORqLbPILfY5lclrzI1lzkCB9izQcDmPERv+f/FcKknTu+wPw==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>