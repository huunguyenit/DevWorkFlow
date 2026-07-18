<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLSuggestion SYSTEM "..\Include\XML\Suggestion.xml">
  <!ENTITY ScriptSuggestion SYSTEM "..\Include\Javascript\Suggestion.txt">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmmauct" code="ma_mau_ct" order="ma_mau_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="ký hiệu mẫu số hóa đơn" e="Invoice Form"></title>
  <fields>
    <field name="ma_mau_ct" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" clientDefault="Default">
      <header v="Mã ký hiệu" e="Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_mau_ct" allowNulls="false">
      <header v="Tên ký hiệu" e="Description"></header>
    </field>
    <field name="ten_mau_ct2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="loai_hd" allowNulls="false" clientDefault="Default">
      <header v="Mã loại hóa đơn" e="Type"></header>
      <items style="AutoComplete" controller="InvoiceType" reference="ten_loai_hd%l" key="1=1" check="1=1" information="loai_hd$dmloaihd2.ten_loai_hd%l"/>
    </field>
    <field name="ten_loai_hd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [ma_mau_ct].Label, [ma_mau_ct]"/>
      <item value="110000: [ten_mau_ct].Label, [ten_mau_ct]"/>
      <item value="110000: [ten_mau_ct2].Label, [ten_mau_ct2]"/>
      <item value="110100: [loai_hd].Label, [loai_hd], [ten_loai_hd%l]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1f6hMZDjmFxVcaS1cHUDq0AaoeupPu4L83hkuGsxFeeNnpLagI6wRb2OWbjIa5L1oEpLmX74RCKgZeflzhCP5Wp</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI0P/H+AZcpPJ+89k+Mq/qcuKprjLgIBErdDU+g6hlfAwucxp1xe51EK9UsRHVnKhqE7oq9yRMBd3Cj4U8MXzrKBxVY9NW4/UuHc1nwyXF12</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIOAzsxm4HIbTYuz+fnSmz6f+i8VAjgPphhm49Xu1SKO6MwvIzaNxxfX5CuKGBhn2mvmIiyXJIzmHi3Rp+EZgA08EMp82BwUabrU1inGSHbZCBAIEru+MCgZ2CHnng4YtQkN1xQjg3EoqZYbkaeno2p6iqOJ6AefSIrBgzhiPEq2ABt5zPfhCWlpevwV2YSQ70IeiaxgqaherJaMbiplzHJ62M6ULlGp2nm9/eRtisit8PmgrkHW9ZpLzS1sza+Fohytt5iCnl3ur7jxE40gCC6C2j1XWJtOfwzdurQrSL05MF3zfdb+2REqfnVVrrvhBoohANXe5k83ICJCZvk3a6GQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUynithtbUg2dzYwD3fwwoJ1BIqzXxU/j20r/bJj37ZU8WD+cbD6iV8x7Ch3qTaeil6AFQeQv/zaR0I6aDTgDEy+PeSCpvWXCzATOIqV/rNByDx8NXUzToa2HCtoxHTpw+v3M8iuFnTkWsA8DtmLuH9AcMXPjCxopsW5B1YtP2axsZozA6U70FLc1ZhV7XJjVC</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLQbhMVzMW3nv0XAy+3QZBWBwPghwrUMTZ4chIP2GNH74VHE/osI3a/xZt2LfPdlK2/MfIf5IXSeYw/0SiGRQuH6C1SyTzpgpdt87HErsOr1NdgEbc37A3QrqS4YowS0qnX8qZfNdjFd/vIe5UCcGztJGKKuKZGB0ufbUEO8bgvbqCUkGSoLurP7uVSIZjxWetRN6GfOv59s4q7bnPlPuAC9KMGbyEdK8mAhq3TpOFpn4=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV5+E/2cr5sNWW81/mtnkBeTybnrcLP/EFT8uLuf5uN/u</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtc4EvazNEkxeYg4wWGJeYxfMMK9qeDMgVl5GC8q9mTHXlh7VyWUTu/rbYCF+uBJMK30aTi0hXjCTYdpFfPfrKsMNXxFNsDhtjp5SRM/B7pAuhSZiMi7eEB/p49G+iBamo3u185vSbzh8YZPUZBhwW777M4nf5XR2tvOhtC3qSTDUHmA7cf25ifEBzCae2UzlVPOPMK/U6PsTqdlSB3TfrzbtEQUpui45/GNFhRITqYS4BOl6lvL8ESJj5EXhJZlMHb9EZ0hJhEF3YORSCZKfbHqeAQf8HIvyPZJ96R0lbE5+XL6yT9uwzrL5qGOEa3fn/i+52NpsHZGwlMBTDnNFg4k=</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>