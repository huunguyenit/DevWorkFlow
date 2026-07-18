<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
]>

<dir table="cttt20" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn hóa đơn thu vượt" e="Select Overpayments"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày hóa đơn từ" e="Invoice Date from"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoice Date from/to"/>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" disabled="true">
      <header v="Ngày hóa đơn đến" e="Invoice Date to"></header>
    </field>
    <field name="ma_kh" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 230, 0, 0, 0"/>
      <item value="1101-11: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2], [ma_kh], [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1vYAAjFzz+9wX0P26tWCriSIeWF8XY7bU6CFZAerT5FUBUitUtwUnGdaEUNn6ZVGzAYCAKYpgJFwBhkGwJYPR8=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6eTCBj89aAZochLNfDWnBza1+juKkxiFFQeOdfhuDY1eMK9jABK8dyTFd7IhLI8W0Am3wQw23TyP0kJeYnAtmxiAzIsaHU32Kt7QY9RDb7qecedTHw9+AAvpGA1I0XpMh6cl+d94QjqrcZO8qQchsuAHE59Qwna9QusSo0bf0H2Cq+pfam2jRJwNYhu8C/IF9ujF8KI3m7n9R2jUTNzSlQAeKmFQ9hOaIkErr9+dFgp3aWnr0XeTAjw/ovOQ/MKoQbkhtLiXu6gnTMRRjZb/b/pB9+I2RAJkie467tljQ5Fn/ORrT672aGw+Yt1BTUDw4v5VhwhSxV7SRtjQv8UqGsRZq5WcLmj4NiHUjs2cE2aElsD4RhRtY0QtwpuRKmr3F2LFDDcZdBZzHwtSoBmwZ3rG92VHIzj+EmWEHPV+H90sMSEwNErx7XSLbxM3UGfGX7fSW8m4WCC1xikhlbp3N3rHok2TbhW8YqKcLuaGAjbEvhyZG71zaUkux5ga2SVgTMWLziC4f8RwXOvxqVdVLm4NCg+VJGsWrX91xztsdcfb</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OKB6dGcNcOE+44WOHfs2taDUFVsoO6aIWT0TU76ua5GRnKVFWqjYuX1Dzj9iA3vwsqo0QYV1ogHS4gtw/5NB71tMqPdqRxsTY6svttSUNRIDWBPXp7cPe6Ls8/zNft3vc+Bl1yMyTVGP8Cb6VOv68+9mHWYMXYP4pslDu/xqxvgHUAcZiXSVCryYBLt8/uTXqfVFU+bBa3ELEMgFBBR3y6gLqG1+pk6Sr0Xr/aMy3R+R8cOBeyI65QLpVSIowWm66oK+lsCMf22T48ypRFsWpZUMlI1xipH5sjcpubhAmKM/S9ABOPa4XXTRRnmCdyYxPJewo6E5B2q5EkHQ14Jc3RAjMUkOsbGebpovB1OTo4NkHqZegwU7R0sRL6h6lm3N8HDdbraWfIgsAo7tOtXbi6JZlNEYfgTWrHwleNZtwbfpd6ACHlGIMj0GT6jSmMe96Btins//f+DymBRlaz9GuHOz72YXTBrWS5GBKgBCkVi</encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>