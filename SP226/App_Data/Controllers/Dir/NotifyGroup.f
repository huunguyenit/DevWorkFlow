<?xml version="1.0" encoding="utf-8"?>

<dir table="notifygroup" code="code" order="code" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm thông báo" e="Notification Group"></title>
  <fields>
    <field name="code" isPrimaryKey="true" dataFormatString="@upperCaseFormat" inactivate="true" disabled="true">
      <header v="Mã nhóm" e="Group Code"></header>
    </field>
    <field name="name" allowNulls="false">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="name2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="color">
      <header v="Màu sắc" e="Color"></header>
    </field>


    <field name="update_notify" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Cập nhật đã xem" e="Mark as Read"></header>
      <footer v="1 - Tự động, 0 - Không tự động" e="1 - Automatically, 0 – Manually"></footer>
      <items style="Mask"/>
    </field>
    <field name="transfer_log" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Xử lý sau khi nhận" e="Process after Marking"></header>
      <footer v="1 - Chuyển vào nhật ký, 0 - Xóa khỏi hệ thống" e="1 - Save to Log, 0 – Permanently Remove"></footer>
      <items style="Mask"/>
    </field>

    <field name="log_time" type="Decimal" dataFormatString="##0" clientDefault="0">
      <header v="Số ngày lưu nhật ký" e="Log Keeping Plan"></header>
      <footer v="0 - Không xóa nhật ký" e="0 – Keep"></footer>
      <items style="Numeric"/>
    </field>

    <field name="note">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110: [code].Label, [code]"/>
      <item value="1100: [name].Label, [name]"/>
      <item value="1100: [name2].Label, [name2]"/>
      <item value="110: [color].Label, [color]"/>
      <item value="1110: [update_notify].Label, [update_notify], [update_notify].Description"/>
      <item value="1110: [transfer_log].Label, [transfer_log], [transfer_log].Description"/>
      <item value="1110: [log_time].Label, [log_time], [log_time].Description"/>
      <item value="1100: [note].Label, [note]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJHV8j0RxSMaMI6qPWV6nyPH3tpvWZkGaXFuNvSChu3il5Q1MjRcNV1UpDZUUx3sOjgQ0TLtaDOk6QEwuAn9UUg=</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIXJw+y6RDyH7TGtu639WBRpLBYdkLAiM85nFKYPqZEABG1J4t7S3j3Afy/+q01fwQ0EoAM/2uWPQ5aigLbxueA=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHmttEt3N+Un1w4Vt8hY+oS9OAl7xY+nASN+YbPwugf8LlYhEDm2B+iDnVN8pTKrELJJ3o50D+U5EfUQAEoQOi4=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV1EjzZRB7IndsfUJc+LjffI=</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdngb8I1Zo6CyAZdIMuz55NwpZy0NRu6pRrz1NWSFaIa5McdN68p3t7C+inVKdLdlU7lQJ8Gkjy75S6OgFSbfJzDYZ68xrGemx+U4338+62lYauQx5MW5Z0ZqmeUVGs9e1AV71O4gVLG1EUUiFiCshPF2K4YBoCJP0TKre/vs26a1PdrF5ioz2f64bm+KZGY9wLHYqVTN9TF6yEUh7oH8tZT2fQ69Bt/XoW/2ZxHhhbSBQjflZLtFBQdqcwlDu8npGzkbpbYLiomQo63XoI2NjXP/5uYlhJ1T1yZ25ikpqiFpt0ZgvzOYyEK9p+d0Tn1GA7cFFjl+Wu8eTil9f3tTQ4qHTgYuUW4dBCBU/RWbWAi</Encrypted>]]>
    </text>
  </script>

</dir>