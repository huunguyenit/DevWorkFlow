<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY k0 "@ma_nh = $ma_nh.OldValue and @ngay_hl = $ngay_hl.OldValue and @ma_ca = $ma_ca.OldValue">
  <!ENTITY k1 "ma_nh = @ma_nh and ngay_hl = @ngay_hl and ma_ca = @ma_ca">
  <!ENTITY k2 "ma_nh = $ma_nh.OldValue and ngay_hl = $ngay_hl.OldValue and ma_ca = $ma_ca.OldValue">
  <!ENTITY Identity "SFCEmployeeGroupDeclaration">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
]>

<dir table="sfkbnhnc" code="ma_nh, ngay_hl, ma_ca" order="ma_nh, ngay_hl, ma_ca" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo nhóm nhân công" e="Labor Group Detail"></title>

  <fields>
    <field name="ma_nh" isPrimaryKey="true" allowNulls="false">
      <header v="Nhóm" e="Group"></header>
      <items style="AutoComplete" controller="SFCEmployeeGroupList" reference="ten_nh%l" key="status = '1'" check="1 = 1" information="ma_nh$sfdmnhomnc.ten_nh%l"/>
    </field>
    <field name="ten_nh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" filterSource="Vacant" allowNulls="false">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl_ex" defaultValue="''" external="true" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Hiệu lực từ" e="Effective Start"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PmJLbDLGB+/v/M5xYbwLXEfE8tU1bOVmlsJsJEUjmWh</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEalcowjoSu0FSt6YTvZF68olbVa5XBshkyTYCWFaIMr3</Encrypted>]]></clientScript>
    </field>
    <field name="ma_ca" isPrimaryKey="true" allowNulls="false">
      <header v="Ca" e="Shift"></header>
      <items style="AutoComplete" controller="SFCWorkingShift" reference="ten_ca%l" key="status = '1'" check="1=1" information="ma_ca$sfdmca.ten_ca%l" row="1"/>
    </field>
    <field name="ten_ca%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="sfctkbnhnc" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="266" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="&Identity;Detail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_nh, ma_nh" e="String: ma_nh, ma_nh"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ngay_hl, ngay_hl" e="String: ngay_hl, ngay_hl"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ma_ca, ma_ca" e="String: ma_ca, ma_ca"></text>
        </item>
      </items>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="326">
      <item value="100, 30, 70, 553"/>
      <item value="1101: [ma_nh].Label, [ma_nh], [ten_nh%l]"/>
      <item value="110-: [ngay_hl_ex].Label, [ngay_hl_ex]"/>
      <item value="1101: [ma_ca].Label, [ma_ca], [ten_ca%l]"/>

      <item value="1: [sfctkbnhnc]"/>

      <item value="1110: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="-1" columns="120, 30, 700, 533" anchor="4">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNI0P19JDD2G8GQW1VvSxieyA8t0sxmZY8xAiRRpwYfP4pnrPgpeW7brVpqaOTSnbEhFfSZECRREjjd7O/rU+l6IPBbj+lJOPHzWl/jd41S85qzCZv4a3AXQP3RVUlqTGQfStwPnO05aq74bm34iIYILiB4u1Cfthd2GLzS130fjLm5Ui3f5a9cPWwUeJmXCVeiLztCaH9znCj7bkMaPa2GaVRKUWBP/CVTY2MmBVashE2KLPhNYZe7q0lpLLlsRBz3UljR+cjGwtYqst9bZwxp3gPMKlG3+8g2viQjI1aMENtSApNcEFovsbFJ3FcLSIvP8XbyS9ixBU69KI3fP6HWsf+ez8yT02nxtEZ/JSj2u5/fUSPInTQwM/y0YR5A9IN23cynngY6WzDIEXNyFeY61NAywOR2F2nKYmNfsTKDuQcHLQEBWK/0KY1+9iVSIpJW</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGBw1Vdkw9kQ/FlKOqcTFTzHkYIP4XCmovHwCHJ7XSRbTXJc1qsnEHQCXCQ4s2G01rvw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGBw1Vdkw9kQ/FlKOqcTFTzHkYIP4XCmovHwCHJ7XSRbTXJc1qsnEHQCXCQ4s2G01rvw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CqQkA+CAc0ekwifZZLEvnfA==</Encrypted>]]>&k1;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUMf09oIkVNO31SlCJTUzH4BghwFF+BAilTkgeCD/TTG5BvrJBg4cU8Hnwdl2FDGAfpeQK45XkjytrfcD68C1n6qTk+bzKV84a6h7V1v7wWPb7dM6t59bLsqqm0uoBX2oeL9eUYZcpFPInIEugOEy9ZvC3Wol/J2nkw3wpRe6LHohAyyeNsIquWCaW710xU3QfsFH+28O749nxvCPOQkiJCxBLP9rFXc+SaaQRHS/WMiTqvtUT6HQEOKKOe4mAT0MrIKHyifNn3Jn+RdWZ9yb4wx</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDynos7OAzfWX18fKgRcHd1kb4hrZ06dYNcL1fuQkCCYXHrSwhOOZpQlod/XWJFpTA==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLqHrk8+/L/kFebdlIYFrkrQ==</Encrypted>]]>&k2;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUMf09oIkVNO31SlCJTUzH4BasblftG40tsmkIgjWme2ebzaYPTt9ZsBUBPOVgisnJNqWGKuRiNbPic0fa8EIy0QX44hHUU/NhB9B9GNW/jH7tDq/E7+1KdXJfiloLW5/kvGNjjtqKNLhlt9PUxj7FEppQf7mcz/IPeDVUvh91TgOkoS6bhtb9/KjDzuvNFRsewmYU9esck9SCzksAg497kRoMzUx4j9zUFN+d42xJZE7g==</Encrypted>]]>&k0;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLbWKoL5jETtroDAedIqUQR42mEpHAQGseHKQPt+hO6zMVZCLu0/56nviMMRE2b0t5VXIS9FErUnVAIrYHbfYuSE=</Encrypted>]]>&k2;<![CDATA[<Encrypted>&YARH0qdfPiWP620v9FAeSPICrzWaA8H4buAdoshnAjQ=</Encrypted>]]>&k1;<![CDATA[<Encrypted>&x2vMhmcVHH3IWkEVW8yP6+iSr8HCVbXk+kp2q9xQCyptWQrzhpyhGAr0IZBpVX1clBbyI1ZUyijv9TSVT9591qbXEGHV/cUbs12NheWb8W1FRDIOyzwV3Hh5jq1Dm77j5eR7KkiWzEES+LXi0non/asNM7Qy1b22KM3Li0daWea5QspR2pztGS2HrxfDEcnv3Gqhg/GvK2ngAXj8k0ViN60eD6OrJS75xiCrLDwcFjQQpCWypVhQezol8VrwoeknEv80uUCq9yCHeJDmod7Q8VCNV8234/bgnxzFjTLz5ho6LyeZscSRGU9lwyS9wg7C</Encrypted>]]>&k2;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4fBeOl38rxKVV1qT3zbw5EXTLFUVUqbDBMIXKmp/W+LRttIhUHNl+FuYnZKvIaSEEJUJcbfN0vql1xe3jVIt1p411tdUxU9j0UOwASrpvu9tk/cQmxP1JZ4fKgmZW1tdvmMRq8Yg33VYZ762thNpaaPWHnHf/HxabnJmeGfIQsag</Encrypted>]]>&k2;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV+ON7PtGJwPs+Ue1dhk9iTEMusobpy/mpGNP17+b7z99</Encrypted>]]>&k1;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YcOGtRtKulttXVbmzlc5ocRdxRBeAN9ch4F89TQYrlVO3mn6jqA7nMO9tWH0gIWSA3XxNlb7leHHiUEt3l8gKw/BUWZ4e98P6I+Zk4xOFm0Y659XYlPQE12K0Y9ZFtdZg==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+IS1ngIE+9Rom1FGcCCmxZ6jxaNMB6h5ylqdBM92THG</Encrypted>]]>&k1;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFUZzGhXQORWDnW+uguWT7sdAERQ4qudgP/1n160+Qvjqf7v8xP3c4acSvyrWXfXliDVl2sAl8jq4AqnUcpe6+c=</Encrypted>]]>&k1;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22X75RgOYWLeen8TBXWNqr4M2v99MnUr5gBylMJvFPAeqOeMGfiFdtaSfoygR12ogdskm2RgcOD7wTL5IqEmlCPFmtLYQCBKGAQxbFCY0roNWkc1pjk/hsE+yVq+Q4hVlbPy9gsmT00Kq6xl4ImeV4HF2EEt3BwCEDwQCZ1LYUxsnq01Uq+fu3RqYgeokdQs6s6ppzXnrEldDCbvWkArz2fz6s7qgNIrQfVrJtdHalOOMD6g1bKNJeRSea1xAvdwYOC9Sc/fW3kRNBnFHDu5I8mz2HFZi8XHShfCLjv6oZsCqOpMBJ+uvBiuOCPtwKcSZL4/UVpjh76D2D23M7W0YnYUsBUUMr/7LofM5OQWaHE1jOsthUA38EyDbJVMay0UPcA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEaE3I4ts33Z+eYAwOzsBYVvec+xFD896fdfCU29HRvqyQkdnB/0YVezBinckTrC49JIniOV1M9AsT3fKXHqKe0I=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB1qPs1ClQNlI/sP9Y3jY2quuVC6+VfdG2H2XIyZI3xpwJtzgb3w1eav+2NLdlM9ZIM0GBMjhKIKaxHs+NcWdolLb7y8NJilamNB3zcrVluq2</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB9mBxkSNAhzBc4bEVarQOhVc+SonkRA4DDtiRGhjAuBBbxMeplmAgFv95/XtOx27Zg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB4VaRGahGbgTx5NNVNt9QZZ1cRXmWv1wZoZ6R9wezN/YjCDleqGQgE+Kz66kr+NmpLOc3Lgbr4QFD7yjJ/mdPUk=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB9mBxkSNAhzBc4bEVarQOhXqxElz4gliQMAWhtKmSwLY0DWXG9kF5niV9X6ytPJBmrMuH8V2aVDg2jgxQw8mUOo=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB7qWnF7smwCs0sNCqJTfyFW2T4+Rnqnf+vig6wxUKps32ec0znRqe0wRAXkI3iIRXZ3VW/atyyZ8JrfkPzYQoZvkdpzR/6sexTmnsUEiXv8Gx7KGHg/8I6WgKq3ElvV66d17mx05jOXHX0YhC4XTLor1sWOYpk6iLFtgXinQ4HaYKDZu8yEIgiD0TYWNB3U4QFa8vDzl+arewbcB5oalNZew9gRRS/C3TmUMgAxS31sF+HE6TMm6b3BqZ/PAuIQcaCOMVJHXK1bfXJpKWMNkoOc=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEVBo5/FlYVS9IzM0/fES4ziyL05QSTEDdsvOn1Hya/HWfdaRNrrsBfCgxWJ3e3LEuekvsci7JfyEjKHgKtjZMBVI/ZoRH2WAGz2/RdIoE1B9ZPzReas2ZE6/N374MOyIrgcgdzbtNg7NY/oxVJCudAg=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEYLRfrppVp9G393x8XyilNNRV4UX6vQsd+K/mhevllQ5uGE00IFdTpHJlJbuPcS9SPWreuWMv3XfsQ1Dkm0Ke0cFiYBm3xm42ArMfmoQeZ4Zx5BfV4Br6fX3EvaVNi6kNaxBpwoPdHW+UksQtIG14ICPWx9MiHfk9nH+/mrRN0fb9/EL4sTmRrAwu30H81IC6A==</Encrypted>]]>
    </text>
  </script>

</dir>