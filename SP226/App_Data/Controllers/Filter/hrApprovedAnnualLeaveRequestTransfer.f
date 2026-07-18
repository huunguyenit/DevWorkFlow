<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "hrApprovedAnnualLeaveRequestTransfer">
]>

<dir table="hrphepdd" code="stt_rec" order="stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chuyển dữ liệu sang cập nhật nghỉ, vắng mặt" e="Update Leave Input"></title>

  <fields>
    <field name="loai_nghi" allowNulls="false">
      <header v="Loại nghỉ" e="Leave Type"></header>
      <items style="AutoComplete" controller="hrLeaveType" reference="ten_loai%l" key="status = '1' and tinh_chat = '2'" check="tinh_chat = '2'"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_ca" allowNulls="false">
      <header v="Ca" e="Shift"></header>
      <items style="AutoComplete" controller="hrWorkingShift" reference="ten_ca%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_ca%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_gio" type="Decimal" dataFormatString="#0.00" clientDefault="0" allowNulls="false">
      <header v="Số giờ" e="Hours"></header>
      <items style="Numeric"/>
    </field>
    <field name="type" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kiểu sao chép" e="Type"></header>
      <footer v="1 - Chép đè, 0 - Không" e="1 - Overwrite, 0 - No"></footer>
      <items style="Mask"/>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="1101: [loai_nghi].Label, [loai_nghi], [ten_loai%l]"/>
      <item value="1101: [ma_ca].Label, [ma_ca], [ten_ca%l]"/>
      <item value="110-: [so_gio].Label, [so_gio]"/>
      <item value="1110: [type].Label, [type], [type].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2n4f7jl0jX8hzbsWRhvYc+On9S5oefEl6iw4NanziAh</encrypted>]]>&Identity;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WGjU2qzpQkFCjeu71KvtT4A9ZJRg88zpKDmyiThoJOmVgh26oMIRvhhhl2euQcS7UQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwSZFYAj65RYzXb1/jCQS7LbKpA54gCakU+hnjiXOE3L</encrypted>]]>&Identity;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WGjU2qzpQkFCjeu71KvtT4A9ZJRg88zpKDmyiThoJOmVgh26oMIRvhhhl2euQcS7UQ==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp08FqSqeIgIuvSVTjqVpYpWVt3P2XZDIpiJbBelXBKWDOjiry1tUbvu+BMwR8tUfKt8mei4a+8EwaaaiKkQPk0nHWsYt3r8F/6H4TfLSQEoLcHYNX/arbCac0zn803UuIOnbWEFvhRQLw04fQyTv100o4XMqKR1vDwoKhSezYNHJu5qZGacFUJxlG2B6+3uuqkfNUDH0yTaW8EwyFm4PJqd2</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70A4fLbLV3kHxv6jagmvQXiQmVKU4qOaErPxnpphD6J+4</encrypted>]]>&Identity;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WAcjwgZA0VTbglx/q24fKlJEQBbWStSAYnEe0ImXIPFpvw7vl/HPllIrwNaD6HnpNQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfOUy5NjeU+Mf5Ff3GWkJODur3AyPA7T9ZHVQwD9Brs/yFSYXXXEET+Hxk3xpg8CZ3Q==</encrypted>]]>&Identity;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WPW62KcVPMSmdsS9yhiqMt+3sPbBpLsmK6WlakdNWE+T3vWGsSE+pwsaMk7+LB7Y85N7g8igveZM7s9j806+AwM=</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfOUy5NjeU+Mf5Ff3GWkJODtzFp+YYWkzFnYCxVkUyEv7r9ZOaBkVF9FlgnQGqdoEcQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfMY+vxj5ddyyoutgGhLGg+wsbG4kDSfy9Br7CB81Z0C7Y8d+ocmYlcPxUdK5t6UahCErdMQpGylb9O/5okkAcaYJaa8XLQGuvDfcTx00j2qDWSiyh3bpFc7wOTQOf+IdjYCMpEA3sZXYf2CxIwU+RIrOJy2qWywP5x7IBtsUTs03Vz/cXSRL6uw6RFujRBteIhe/4Elum8DNhEITP7DU5rtUi4y3mfxJ3egujCiIq2eL7KjJERWU2qcygnnWBYCrfMuaeX+MXenpM15FgGzOf79LxW8E62EF2OBwr3v9vgxHo/uuqV1om2itJjFRDyNQK22Yhps7JgfqWYbTDkDmIyfntr7Z2BaaDuUBgpXlFwHTOkMaclbNzhxaqTcKD66vIZvrP6NflTBUrk2tjpHsmcoLjd2QkgCch71rNLxbtqUUMx2ZO4gbWJSpt8agDR3uF/RS01+DBgw/66KnhzP2NUAB6xmDWUpNdBLezxTTrEvCf/eDbR2fvENn5o6ZwN8cdLp3Lv2P2akKj3bJx9lOUg/LW9NSeRGIi51SRzCjf/DUO7HDvCf0UkQwx71gdRpBPY086Oo/9laCZyPz/yP/XKfFZQHbswvNWTqzpbxiA8ZdnEF7j15cJLXPjRqxdo95Pc2SX2hJyyXHW0EhKCAUsSA=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="TransferLeave">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TmcN+vwxFPysKXWnqlWmSQr7JG90QBJHoQ3Nh3VQHi+qhDev0JF45rInFwdzy2gSdx6RK4/b1/25LDbyihHKkcM6JNWOUpRB294AxpxMcbishHtsrtDZFdZck5ciQc58dXYnrPgn7eN3WitrHQribs5yS6UQmLNta+wdie2nzjhikaQdxtob5KJg/P0q+GI0fS9wLlHKV+LHsU/c82MVA1lqK2IwXZFlMgrDJPkZroiG8ZA7ZQrAyDW4+uchTBXAg==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>