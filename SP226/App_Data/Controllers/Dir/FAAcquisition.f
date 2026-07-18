<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmtgts" code="ma_tg_ts" order="loai_tg_ts" xmlns="urn:schemas-fast-com:data-dir">
  <title v="lý do tăng giảm tài sản" e="Fixed Asset Acquisition Reason"></title>
  <fields>
    <field name="loai_tg_ts" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right" inactivate="true" allowNulls="false" >
      <header v="Loại tăng giảm" e="Type"></header>
      <footer v="1 - Tăng tài sản, 2 - Giảm tài sản" e="1 - Increase, 2 - Decrease"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_tg_ts" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã tăng giảm" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_tg_ts" allowNulls="false">
      <header v="Tên tăng giảm" e="Description"></header>
    </field>
    <field name="ten_tg_ts2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" anchor="3">
      <item value="120, 30, 70, 330"/>
      <item value="1110: [loai_tg_ts].Label, [loai_tg_ts], [loai_tg_ts].Description"/>
      <item value="110: [ma_tg_ts].Label, [ma_tg_ts]"/>
      <item value="1100: [ten_tg_ts].Label, [ten_tg_ts]"/>
      <item value="1100: [ten_tg_ts2].Label, [ten_tg_ts2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwclIUozcu7NBlpn6wkcYf9xUbmmPnsMpQmTdSjrTOWlPAucA4rQdF3JV2DFjZhaQDpLjR1Z+fVIumXwDMCEKR7d</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYay+p/fqO19zuxCsmWS598ltTQElTjLqXbF1dKZfQRXqkCJVJ9Lva2XnuCBGDU+QtA=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7eY7dT2sn56UexbbkBc9bnxzEv0sDoP6WVDkUsheeNez+VFXal5sP1xt26MO+he8hZaKSHGQVW72fw9+vEEfMprJsok9KLteKu4lSiWH+sPLyCoGxWf8Gb2aOyQ0rA5qT/P1bf/6H/XY/zQeb8CA0jIhDyi9AK1zJZEY4brK2fncueb6UFrowuq2tPrayBB/z5ifb5bmMZSJ2wMAqN2XDTmVDklTCRbzLgVlM1wFSND5u+o6QwrQ0hqhwTRWU7S40l2Stwd+tKKSpY+khmcIpVSq+1iCbvtzZom8yOF/RyRpoi3QjNb93yIz39oRriQrHnlydtPEg3kBzlfvmQrmEb5zoa7Pv0+favk2gVBI6vDaeGf1S9Dap/HwoAueYzLp2mVB6Om3JAzCmJgMRVED7FcoRCugWuVlSEL+cW/G1ODQpDtLkTfwo5h8Lg0p+ej+sinehMNSgUPMF62C93tjmxF</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nEVPvYDh490O+hYbNv5HmfjncGMXtu98eebG2p2aB5/PIZYn3r5i4gRtSD4woUEZPaGzhwBVhTs/8ss3BTRj7263U6+4O6VGbgNLUh+i7slfvMl/nX31sZA7CQynL5IwI/+nQAo186arymOfgySYp8dxHKJ+b6FKQf1JO48BUkwEfYip15mZd0WACp1lc2sAy+pUyQfjAz5o7JSvQiAVRkR2qBsexv5Y93pXTrYGNTyI=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jmO9OfK6RwUrqaN5PIBUHcimQNWm3uJU/qaWu/xmHdjRD6Dbobhk/IwTfHtzd2PrxJrUelFGRMD2ZAGV3cAIlhM4yVZ4VHnr+vf/tvM6UrZ79umIQl95eC0LHSre17lftdiNTHvHpB4gmPB2fwbIQR518uQMoEoipKHtj60QgLkqlVP9nHyKV2kaDaqmnBDeROHoAZpwYSit0Y7JUvP9Zy+7BvwdWhBRd5xgaR0bjBPfrjI2bUIH8FMmZxBG7WkoIQA9+hVPuXcZhdYg1547GfQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeg0IAAooYCLX9bBra3py/1FIuPSBOX51Psll7wlflW4r</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZUG2svlpPxRLRfr3alxDhkzPvxIj9JRk9mvQy5PLOrc9JasvANnGOjx9B5GzLzz8vvgWUwHNTTynCqhPJX7Lbem5Zwz5ixCUsJCIkSWi3JSthm6MOSSDJ+9F5YD4/hSuRwFfi6YtEtfMxR2S6reJeiLLFVzSqN+3QAHC7l5QLU1Nl3MENIoyo/rBgoOKodSgAGkZADL/63ZLY8MMMOhB9UDwEzqdc1D+bkvBtc9i0fE2KpMohCe7aQQtP/5qpVDenp+Z2Tf5T6FsxjMGiiRLTdB5flhyGtzZcnKxEqcEzZ6MGNo7OQJvJB6Tdhxw/jOuyNLqcdMPdSwOaCUXvVE+9/</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>