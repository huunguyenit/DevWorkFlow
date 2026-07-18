<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="v20dmctnk" code="ma_ct, ma_nk" order="ma_ct,ma_nk" xmlns="urn:schemas-fast-com:data-dir">
	<title v="khai báo sử dụng quyển chứng từ" e="Voucher Book Using Definition"></title>
	<fields>
    <field name="ma_ct" isPrimaryKey="true" allowNulls="false">
      <header v="Mã chứng từ" e="Voucher"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'" information="ma_ct$dmct.ten_ct%l"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''" hidden="false" >
      <header v="" e=""></header>
    </field>

    <field name="ma_nk" isPrimaryKey="true" allowNulls="false">
      <header v="Mã quyển" e="Book"></header>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_nk%l" key="status = '1'" check="1 = 1" information="ma_nk$v20dmnk.ten_nk%l"/>
    </field>
    <field name="ten_nk%l" readOnly="true" external="true" defaultValue="''" hidden="false" >
      <header v="" e=""></header>
    </field>
    <field name="lstuser2">
      <header v="Người sử dụng" e="User(s)"></header>
      <items style="Lookup" controller="User" reference="comment%l" information="name$useinfor.comment%l"/>
    </field>
    <field name="comment%l" readOnly="true" external="true" defaultValue="''" hidden="false" >
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [ma_ct].Label, [ma_ct],[ten_ct%l]"/>
      <item value="111: [ma_nk].Label, [ma_nk],[ten_nk%l]"/>
      <item value="110: [lstuser2].Label, [lstuser2]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2+j97jlg+7FdtYzEuVP0WZTIHaGILeeju/2xMo9QgLt3jdNnFccosMebh5UJ/aS8yQCsUwdzqQb1HYFBunjJk4=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliTALPvCbqmHwGoeAPuLmm9fTvZg68/a6B5soKABNjdz/9UVA4XJHRSOuUO/Qhb053XWU3e9UwVXttslnJBBugKifTmXLKN4cxbbTu3UfKm2h3aSKyYKAtqcy4GEWFCFOJNOfSHM/EMUe4mHu5NMaixXctxWyQGIh2nbhhYZLOSJcA+in1R/fwk+uqX+YVvNcX2ZAdsY4jEoZPONNwh47zijSojkvGatcCMT8FM/1ZLeyxVne2xhvlRH1cVzWzmxHyuqDGOI9lww5vblvLse3RE+4ip0LxL0dR3qXNet3J45pOkvblaMEJ5agJcqEQ5iiDn298vZbK3cuzkQmVcmSOdXGXTAN7+SCoREq+YIKv62O7Qe1oRnsuQryg9uogh3r1yBrtZnaETrwNaKKBfNTEc9EvTOzUTFvr9InchwqIc5Y=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nh7UekWENOj7GBPWSStUzaZHToAaNWIdH9Gtil1qlPI+I0IYZjhK9hWbXeWfnZA1t7yRGyREiLNageWTcGs6fpd3bRP9C6AXSbjNz1b2hOz86IJnLvoKCvdbQAbfVfXFsoW41IJRDH10R2P+j/9gzo29nRtucvN7fW50u8zbJzw767wB38mVldYJAM1ZUBOedLp6I1Pb/EWwYZFQrDaxemqqwLERwQItTUcuplzcuIDXkY1HD9K1bX+1e5WJ8IL338wPGNhWbDqBiLPN2PzQwSw==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Kk/cC9nBPisufycN9Tth3C9YC/c4kJsF/Bt45yJk3h0bFrLmfPCeQEAxhUjO5OoUlWdeLd3B3NxXcDTR8MADGgjhQKeE4J8b2DekA6GCaM4wJ/VnHt5Vt1/4Xx1GzW00mwhNX5pK314qnFTqJX9JMLXjEALDAFbiCkcHDj4V/dn4585cmyAycHPiDPFEXixTIxpp4bsaLbsFoiZt4sndEGlg6Y4j9bRcR0OdPzjI7WgT3j9tnxCvB18FdESMVEVYhxMuWo/IGDJjWAI2K0iGr31jHHfUyFpMaV8stmMSkdOVczi91kS3UYaV9oNpHK35Ou776R2V+V8fw1onZMxDOk7ZoWOHbiQDioq6Z0i2M3ZF0Sm9F+yHstYgPGLOezzJxg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7oimjbxijK/KxWX80guA/YhqQZVzDrrZlt/PJzS0TakY8E9bCw/xehLliiq+OEXv585enCADA5vEhKbhVn6Ejz97Sr3GpjxtzM2E+UgCsQjCdQ==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FW11TMx9O4os12meFBJAmQgY4DKdwZjGEM+blcExyDnc5YqmRgwOLfr4/WvLm306JDcGgk1z2Jd4RpxChTDZlRHmlfgOEJwbranFl7bmVJf</encrypted>]]>
      &OutlineEntry;
    </text>
  </script>
</dir>