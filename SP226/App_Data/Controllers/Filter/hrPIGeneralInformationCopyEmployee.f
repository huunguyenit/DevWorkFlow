<?xml version="1.0" encoding="utf-8"?>

<dir table="hrnv" code="stt_rec" order="stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Sao chép nhân viên" e="Copy Employee"></title>

  <fields>
    <field name="ma_nv2" allowNulls="false">
      <header v="Từ nhân viên" e="Source Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv2" key="ma_nv &lt;&gt; '{$%c[ma_nv3]}' and (@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="ma_nv &lt;&gt; '{$%c[ma_nv3]}' and (@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZSI90PFWRrtWUyIEk73twnz4dxbaOk5Y69TIdt/pCAydSKE0og9WVU609xvBnW2NPyQRJDNuxTGtH9ZZf22E68I=</encrypted>]]></clientScript>
    </field>
    <field name="ten_nv2" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv3" allowNulls="false">
      <header v="Đến nhân viên" e="Target Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv3" key="ma_nv &lt;&gt; '{$%c[ma_nv2]}' and (@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="ma_nv &lt;&gt; '{$%c[ma_nv2]}' and (@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZSI90PFWRrtWUyIEk73twnz4dxbaOk5Y69TIdt/pCAydSKE0og9WVU609xvBnW2NPyQRJDNuxTGtH9ZZf22E68I=</encrypted>]]></clientScript>
    </field>
    <field name="ten_nv3" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="type" type="Boolean">
      <header v="" e=""></header>
      <footer v="Xác nhận sao chép" e="Confirm copy"></footer>
      <items style="CheckBox"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 80, 100, 230"/>
      <item value="11010: [ma_nv2].Label, [ma_nv2], [ten_nv2]"/>
      <item value="11010: [ma_nv3].Label, [ma_nv3], [ten_nv3]"/>
      <item value="-1100: [type], [type].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf92P6KyKiW74g3OlYFU65AnnVfTVZCeh3v3p45smeRodhOT8918qRkoCIiNA+32/bJ+3QoNM0isBzy7UohPOTjgQq953mcx/KJc6HVHP4MPB</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/kah7Z2axlkCp/8X32tkFm2M7R35laOO5zDyvNZcHlwTNbU+sqbqbeia5F+l1xxtqLuLqlujiWKVla/HMY85PjeS3raqmcoEHTD99pVXTgd</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0/1d1zgYmz6r67Pu2L41vAX/W5fn6qTwdyl+PPOnUeIvlRzAQTBMxcTxZUHnN4M7apGU8AO3eudwFG7bOWSwDAlr9rYzisvPxaHhAkPtH8lnPkpdaoCvtJDZBf9K3Qi2GPEjeO+CucP/a4EdPmyoRxwH9TqJgo9IXZgbD1bx95iIuDHs/n1/8A1B0Y2j87cYIxB0bhbYmwWdw/9s/SrKev0q0u4oEmRW6QBriQH5rxgMKwOcQ2gSQe8oTaGG0/qrDFQCgerkawFPwkhQrkK68dl1UF1JK0pwfpLziWF6w7E1DGbmv2cFou4KbNPMJ0O+GXC+I6HOQBsnp19YrEmnO9PKpua1xBVGBaqS2G19mDMpGAM0VPTu2MQY3sG8g+zLdpJOUfML8tbulzNffWau5Wlvfkz6V5RS2EE8fMZHIvft1qIr3+//kH3zj5tAwDr+v4Fx0nvl873IloK2xI8UEhC9kGNhyJ0J3xrvCyl3J2jOQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70I3hVmiEjwMPML32vpnqTYsBk54KiwsMojs8yJpFMPmpOULf1hgDkMzo3CrQI2XpSB586TI9jla83oIsES582847Jxif8z4oJBlX+rAuSZht5MOWgutpCcvC7HqF3WiBXuobAm5wkgBIuh1zgkb908oJqbYWynrMkT7AzXS/UgCPt+l6fVHY6XpTkq84hKEPTQXtrB7DAiFyK+8nhPriefh/5UbwPo4GBu+NzLj/qfMGgHR8PSylsJ2ExipkPXbmfkwdVz/yCIVNrz6PnBL+OkG1F4fSTtfuFrR8K/hroQbK/ZMErQ9fSbmIJORXZ13zUFYu+qRv2Yh0QmCRqbEJpLMqzsMDFzOFnQike+BeIcg2M11qN+cW2yq6zN28TjM6AvmW7A6LrUFDMMh+DQj/AdWAXz2+pG/44S4BlRtzNwlMFOS/v6P+FWcmPqWQg1oRJvLIY2dgsDkEkUAQb4xDe9KRzOSzu+U05xx7flUx0BuXA8rPW6taCzCNLNOBYGz+8K9YFPjjU6fv6UtL7MkW5C7DcJBFA72teCSRzsLXhQted1J3CJMNtvTp5A0AeqQimm2RfLjORevTvcs3c3Zgin2z4CR9/70bp3/UcA5+wuA9kBEfecI5EpuFNBhlRrx1XyXsWSS4De4ThRpuR/wUEnKUCRlDVX9pIJDjoT3rIQGqJVHUgNzyJ/NcpFxjyrANIp+9bW13UC7W9NGYqYPINait6SNbWzNKsW9H8Bdqu/YVpw1BG9CHydDtZY4/+4MCOW3TU1gE7BMq3i1sd+wkJwbiIHMYt/JnvcDWSWXZ80jITxKjFe2oxZhfOP9c0zbBGIUmV6oWUarqHaYmMPrnKnhtYaNat52AS0KkjUuy8WsFbeBYWPTeGK4sQ6hQ8ddhNw==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="CopyEmployee">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6aWZ5U2z3wvXwPAVe5HTIVO6v59cb88X+JJ1G24KxaEy/8rjYwUcpWBVz3cLMIhr2enHRP25v42JT9D6sSmgN9xTy+Ugn3RZG9ffaO+0dggKvFoG64v92Hf8EVGUDAORQEdk6EvHmR6Hcph5/6yzp4Y1dn15Wgd0cfjjqBKs6q7n</encrypted>]]>
      </text>
    </action>
  </response>
</dir>