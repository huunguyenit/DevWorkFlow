<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmlo" code="ma_vt, ma_lo" order="ma_vt, ma_lo" xmlns="urn:schemas-fast-com:data-dir">
  <title v="lô" e="Lot"></title>
  <fields>
    <field name="ma_vt" isPrimaryKey="true" allowNulls="false" clientDefault="Default">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l"  key="status = '1' AND lo_yn = 1" check="lo_yn = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99NDCTdQsOpmgcdEndIAYV/y3qIKQQ2NcUXJpumafM3ZUBQoKAh2SkpFz9lxDmv/xnw==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" clientDefault="Default" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_lo" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã lô" e="Lot"></header>
      <items style="Mask"></items>
    </field>
    <field name="ngay_nhap" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày nhập" e="Receipt Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99GKDbKwf/sidq77U/KT26cpitO8oCPxCnSKahbssjAns1Fet2fx1nFWszGvKHjVMRw==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_lo" allowNulls="false">
      <header v="Tên lô" e="Description"></header>
    </field>
    <field name="ten_lo2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ngay_sx" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày sản xuất" e="Manufacturing Date"></header>
    </field>
    <field name="ngay_hhsd" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Hạn sử dụng" e="Expiry Date"></header>
    </field>
    <field name="ngay_hhbh" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày bảo hành" e="Warranty Date"></header>
    </field>
    <field name="ma_vt2">
      <header v="Mã phụ" e="Part Number"></header>
    </field>
    <field name="ghi_chu" rows="2">
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
      <item value="1101: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110: [ma_lo].Label, [ma_lo]"/>
      <item value="110: [ngay_nhap].Label, [ngay_nhap]"/>
      <item value="1100: [ten_lo].Label, [ten_lo]"/>
      <item value="1100: [ten_lo2].Label, [ten_lo2]"/>
      <item value="110: [ngay_sx].Label, [ngay_sx]"/>
      <item value="110: [ngay_hhsd].Label, [ngay_hhsd]"/>
      <item value="110: [ngay_hhbh].Label, [ngay_hhbh]"/>
      <item value="110: [ma_vt2].Label, [ma_vt2]"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1dAUQDkdS11FHRPG1QPIQRey8m7iNYUdwKn9le7i+DrWC48uo5W77k7O2sk4k2L8gKojT484s0Tcrkg7R5P6pQGIxE18eoLZvVWwlA1N3slKw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFLTtxwxLS0qUVnguBBCPvMrrP7vl8SzMRffSINzQAZStTkNnmGEUwx+Fd7n+FsPXboOs8Lu3Pb/dYSlDQGzLsA=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVfK/NCPDhMSW1bAIXdU+QckZVgeFDw1lvwzbW4aQLPjIwaS6ACvBtbFKkH8K44onDq//wP9L6RECYZlDoAlCwfOUGHFll+gIMQ8mqjrVnfW5OC432NMjUGwMhak/AtgLH4Zu1xeeE04bxFjpvu88GJE+OIB9z0tR6S8ASkKU+WFYC3BgfQmDSaQlqD/l29vLrHRu9W+8/1LKb2LJIGzkZPbNa5BzIegsUBk5X0JrdagKM9/V/RHJvEyHTVJq56pNFeTuLRMhTaKP+0yF1Kimtr6s3Hn0ohCy8Ntf5sCvg/bfO/x4uCDlS6ZBMxY7aHR7J1pAYEFsUU/P9X6ZSF9PAM4ZjPebq17AlzKjvw2UaV1jptGROzDph3kznz8UXQvuxvwvN2Mqj4umYHnmBuiI27Ut2WLYn2xPC9Xd3Uq9OCwkBh5FVCqnusPzc0I1NGMaXscZAV1iglcguPA9w3BAy9wV5TZLI1fha0ILheRyDpvJ/vMA/b7xBAkyQhXUxWxMf3CJmXllfhlZLHeSpCrCC/DEkZl5Uz9fefDOARjGpkRfNpyOuxxuY4Z/WfQ5fTSU4HA/6rvy6QkJaJdH1C/xTTw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CSov8WRJVvxkoylCx6wPPWaCKNT21lyvfM05SxKn0zMitMG9+W6S9sgyOQm70fxcrakNAuHEjHlEzM3wIVH8j3wNQwnjTksttz94NbkQjMaZoRa3DNjgOozxGHri8co73diKJe32GS+xopIFseK12RpMy54TgSgvEXAvrNunV50kDRYVSU252LWa3UqwJ+IYsHIYP658RZwApPVcTQrtgEE6f5uilS1GfztEngDRnEOSmSM4zInujb33x1behbnik</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteHlGXOM4Uz6EJnTQeSpNK1gSzqtj0lNot/HMhbB6PBlWkroJr8lG9LI46ZB1tcHJRN1TZ4rdBnukuJBmAPGcocGEGbXf1FEvBQZ42x48yDmDiehRQ7rQ2q2Ffxj4R7b6NNLX0IWHN2Nzkm1mQc7y1CxhIzGgOzuqJuGUC+VqqYnG1OjqpaULObl8JMMs53nAvDGUpCmdufJ4pJvWo9/4ku5RQ4DlUshWBNwSwW6T7fV/Cql1sQBHDeUpBXkS7WJ0Hf+0r0fTLBgqWdgFI/4av40Pi3k+Y7dvNXylotYzJexhDGfDEgb0kem23miz5zFKnqsF/4efjygHQN/phfp6Xvwo3gAyR6JM6qXE4csLS4wxPYBK41TvMB90S9pG0FQs/</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV+DsAOnFycFwSho07PjXu7D/W12pUNnKDqHNsDs8Ciye3zkbhl9wHEUl9MIQe4bkqg==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6oCzsk4OOFIgLRX4EJj661+MDhGctcay74hp4HpEjf8/+iraog4Qa5HX3TFee6J0Epp5+8yXbrGBkSMLwZEAORIAW0D9/ry2IS2dI7p1rU1jhNZWwk3bQtlKSWH/MO0YKGMcx3GXNzg8ESVJxn8r3dWFFDMpIRSiI6PZAWHU+za8H1m3UND0umVBvW1s5ZhiY=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWe4xMkPicT/Oy0mzXV9RfZAjsOGNNmiGt5w4nr1jznpxG54NLWVNU/zuGTDnBlIN8a2SoBsmmS8F4DBqtoXfoQqa3l46I/5JbcHzeBvP2kSD+Ou2w/gvNn4d8f5mpEaki3dVv0+l0T+Aavfq63foecN3LUR8d7OFwfHipdIvgSJtsLDvMgC0Ulzp9E5eBSzv1wYhFngnzEisqBAAm6PsoacXnNo9yTshpM8NFXlKtWFgQL6w/p2NS/E1q/ZKlm3iOUYtOeq90bMqMjDBmyv08TjoePMYN0SNtjai6/BhMtll4cianhlH2s7EF4CDwISsF6d1E6aQHUCQbPoAqnLh8ef2F11ppa2iaa9Op8RaNs41er7QzzcbKNROl/UnIWSYici/RyceqOmS/oqju8jHA9ZoxcnZjqy0HBSrJk1zlo2pR+uefzT7PU7/me35WA533V/XQW1krlVKSwUcNjdzI8VDyrQ+1LKAHy3dTSn9QD8PuFAJHKU9VxIwQ/oXlBEEc9/9u5VUyZIqjduJaTtWMZkpUPjz2V7LR2DM9T6Jfr4MDkBxL2ca5H/gB3nlIWoJ+HBQTgliDBC3wWhZeVJVl3E/Q4cxBTfo7LLO2SlWHl3WnfYwLtOqw7u3HsRYPi5NELd2Tcsmwy1uWhZ64aVc7XdEXmi8usqoPlhs7ow19S+jrDaRTCv8pdiXVEul1k5NOmAw7EfdRkUn8pfPGHQcvaL3RsthU4+mm+UEpLLfaMqRYff566FbYcenxMk+JXOieNlqLrdg4KgQFQRN+kdmOlXUVr7fUh4hWmI/xUfq8LLlKJmsHKLgsIaDAgXj8+1Znyy/VeezAQHOkAl3ILZzyb4Z+qLR9O5UBhDgrwXM8C+4crpm2YPHkLiF6SU9E/D1OehPQfrLs+0ghAvK17kXSe2CazGNT7TDac/608EeF6IVZ81+MMaIGC3B6r+6zPlV9RyRq3ankcfFmMpb8y+MUqsORARG7vsFIGr5Fu6wvZo</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <response>
    <action id="LotInformation">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp071gWJR13jW+CLJ7j6hnYzspM86yezNYU6DmnaEju4bWSamBBo/QTQRPEUpb6cfdz363GecfwbqclA7FGAZ53a8npTvYeWLTe3jtRva3vNFFuIlYSlFsvCF8sn2HnZCkpeZupUY/5NtvTmbhnLOuM6zA==</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>