<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="hrbtkcl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1))) and status = '1'" check="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)))"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182">
      <item value="120, 30, 70, 100, 100, 130, 0, 0"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jZxdMjZqmSu3m2Y1f8HxlRAdUcsaY0176ksLlycXPMUrG503TUJqr8yaEwX1K4kEmaTaBjhLQPTer9BxvEBFBFFImPuRzzE9ngMvEpLXiol0C81VzmkgIePtIm9c1bDu6lF3PrP68lZZBpfxSdWV8A0d6bZ6DRneebaiAjkeaJtiwO4kec/pZMlwLcFVah8gZbEGpNvlbVZgI/RxL1DaUjK</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBb2AweetwuRSjNIt/RVItfnwj8KETZUspDystuKQRyhTh86bwcTpQag/xXBgmMcjIp6PvgqEXudtm/PtmqEMpB5UC0FBX55mAmI5/ISTWc01OaYo8thuThgbqnk90yWlE+DHkd2YNZPSy9ueJ2FmQsXuPVXB5KCWTA5rbP4OhF80equxn5UWkFrTtkzUfymIFrmxp3tK1/qIi/4qgR+x2+UYhnVegJTXCdsXK3dE6T5Mwbq4zYqiuIOuSjCmhrNU99k9sc/l8jTDIf9HRfyKcWhRPSH45JY9huf6GJxpF3/7xqC9FIczRSiCf1V48559O910jfUO1SdQ3m4sBtyX6zMSN7KMfmZ/ouuJ6LGTPcoCFAdEmSzisRC2VyFC7vcy6R8L1t92d1vROsRlGrMXfFLUIxTIxPvLy9wOdZaertGzpegUvJkc3XYrrnq83erB5z5SAuMl/Au7Q/lhWVqCpGWWM9KZPMwMmhTG2Bp7IFxRA==</encrypted>]]>
    </text>
  </script>
</dir>