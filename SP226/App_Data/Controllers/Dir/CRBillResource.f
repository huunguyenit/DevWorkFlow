<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu0D82jUeZxaMtyqicDeohsH2EluyUuHUeRI3D1TtElr8J8OpYA5WCYRuJvDmlArfhZ5Tawb1zIM9cA7uWQX/lmso7NQRnN6LSBkvhA2e+fqcHlD+fF3iilzvOXMQWDuOdZSvP/CJpoKS1Z6QHIdcERXPdAEscPep0RiMjzyZZwRs9E4iL2N38OBLDba70czPVpXiwubdM/I7wCHSRz+hdyxHSgl7lA9MCFEkbzOeMLIHvhvQqAFXAc4W0C9D+22UE/6Ox/y6E8YRvzDnWoBAqdnvDKLLCaC5PUmJkihfEvOr3GD367gSdSPK7xZV5pKi4XPiFDUjC8OpSStg8yGl6nJY307SJQISYphkLjTo9UkgL/AHI6UWNQg/dRVM4w9kBg==FastBusiness.Encryption.End">
  

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.CRBillResource;
  %Extender.Ignore;
]>

<dir table="phnl" code="stt_rec" order="ma_sp" id="CR1" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="định mức sử dụng nguồn lực" e="Bill of Resource"></title>
  <partition table="phnl" prime="phnl" inquiry="inl" field="ma_sp" expression="''" default=""/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" allowNulls="false">
      <header v="Sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="kieu_hd &lt;&gt; '0' and status = '1' and loai_vt in ('41', '51')" check="kieu_hd &lt;&gt; '0' and loai_vt in ('41', '51')" information="ma_vt$dmvt.ten_vt%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7O8EheGyWBp7OzkyeKxaXsIwTIfqYkVHN7RSSROjlVYA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dvt" allowNulls="false" inactivate="true">
      <header v="Đơn vị tính" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="ma_vt = '{$%c[ma_sp]}' or ma_vt ='*'" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dnl" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="331" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="CRBillResourceDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &ListField;
    &PostField;

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="391" anchor="3">
      <item value="100, 100, 553, 0, 0"/>

      <item value="1111-: [ma_sp].Label, [ma_sp], [ten_vt%l], [stt_rec]"/>
      <item value="11111: [dvt].Label, [dvt], [ten_dvt%l], [nhieu_dvt], [cookie]"/>

      <item value="1: [dnl]"/>

      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

      </categories>
    </view>

  </views>

  <commands>
    &ListShowing;

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ioX2dlA71hiUG10e8IUM232bL0R53xmxxBG3dKiKlNtdMOfgaMJ4Rk+iTHZ7LkuMzxxsDpnEvZVnxZeaWQ1nxuQ==</Encrypted>]]>&CommandCheckVoucherHandleBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6itb9oc3RnP5TETD8Hn8rWwyvxJVolhQj7eL9sXB9J2+eGWwuBuk9Ec1X7wbq7d/JO</Encrypted>]]>&CommandCheckVoucherHandleBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyaVpCbdGljJ0ivNhQve8w+0WE+YGD+Xs2lctzeoiyOJH/h8SqxR3WPwXECQd198tCC/XFlxcPPsbgWIIETqz48RYzO1iBCzfOUaMrw+Aw6MFEXOOeEYNM8B8KKUhODzbowIiq9diyoSWK6byMPXSKuhXuGD9ecGGlsBi8ZsLg7aSkfD1YPJWJAsVtbZ3lU8aKWEKiQ5bKRebe/I1iXToqBtm4R2IS6hj3kBOTZxnX8W</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2GXVEW4+Qr3bPaP2H2ciTj77TVegm5mUz62UvScek8mbeL7y7s+/DrPZW7aF6QKY46FAukqB2wBUNUk+pvezBnzCmQx6Jt6fMQkRffiTdDQfJApptlid+JsZkfOImptwIHghLqbDqvCa+xFp0Jiil8y8v/irwxnuUPuyUER/iWOAe0HZ4IRw5aRxeCjYYSTxkb5EOZkdcNtxtpBxZX4vO0DQnb/O+UBEQu/Q1nhjxQdGtSbkd6PGqFuxwO3uJF7Yk=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcABCz+CaAX0lpfMh9FbWFFjuVlYfG4F06mqTTp1YSsz/2TKj6b+Ry4VD7Kmz1pSNwptZXbttFP3/8pwGkNgE58DahWpwlDAQnJvB4eoDc4KofRf2sOyw6/CLIlCg/27rxn1ecN6IT6tK1UhF4+UttQ2I7L9YbLRG542mYi9RFgeLAdXeZqGhccQdxSl4/y3MAN6oMoWes5aTdv4TIbd7uTW30VtKPRe/XCcDpaE2+/yWvd+sJOv2UvsQwiS1PYktgENytvOnJDh9SIkGIDHOrOTO9QmtLRq3HltJOrf5QjhL</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAehPW9BmLdHFxAsvhQp/ppRG4NYV/qfbtvGP0yXGw2coTH2Apuxje5SGLjfVGOY8A==</Encrypted>]]>
        &AfterUpdate;
        &ListDeclare;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0wwC+To+U3hJFkQDEkgMNaVxRVDarN56oMJe33BFsVNsn78i91f3K64WJT1iSYobUw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4DB8inIYwPOt2bFE0+Y+Xp08b8U7f+f6nUfQsd5LzVhsHgAlPqYTgT3x9lv8Ynttrct/zN9u+4uE/5IqLaferGctP1wjnY4B8Duv9bfDFBNusER0xPEwWUecHzUxoVR+kbWupE0QmNP7RVz4JYvKpher42KP5FVM6HZ5bBB19ZZw==</Encrypted>]]>
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XRSypTgAV7XQ5/UV1OmXR9zGEJM5bZgOrFkJFsA3bEygxxc1fVJn/g2w7rssV/GnSBCc4rV35QViWBOAeVlIzGIkH3Rs5VAczwFwVyrAYUtjIlANp+SJXRNUgHgd5QgGEJBs2vdBkd9JQzNlEQiJt90xuePZZESwPuV/C4BLbWv</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XRSypTgAV7XQ5/UV1OmXR8FS3TIhSEEx20H5Fg7qWrbr3b+xTNzLcUlihP5GHzzQCf0FZHMS2qCVNoYjnVRoisl9xunfVbw7AfsgwxQkEh4DdsjNCuuL5MElCQJ4DcS9QYVBiRgdvKeb7GEXo108xQmNF0uqfP/ee/sS5TMoQ1g79Nb1v23mYUcGlEj+S3qfw==</Encrypted>]]>
        &AfterUpdate;
        &ListDeclare;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8aaaoT+OOaKwOCnW4TCU71P5E4Y3Q6Fl7odJCbS+PKhHudYEPZtZz5O2QCDgLIE1g==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTLuRqas6Nx6jSt96pJBFnPIsDEBFcQ9GvafnGX9D7/nDxzqYSX0nSAyVSq5cCl93rl+CqF093SDos7laQy4aPboimYmWMYlrS3aB1Kue0/VwByJkaf9b7NET+qaUr6QMfysbIeQHGMytx30V0w6Kqc2AurSaxk4FtSXOf8Smcqiz2L5oj+UMV3+g7HWErfVlwuAEubcq7zja32EGQwmckueR2NOwrta9lsUELVvlspy5H0AlJ3HGHnEeq7dKOYX2NIdvCXmj8o2NJtZMwcLx0feJZfe2zlt9uu/NzhH1OjCmjvDPBGXEjkTDxZg6EnTQpzKTCo6bCLEiOl4QsHVBDnl5ytx/IuJodoED57Ktm330a+FNdonFobte7/0CiGFj2DyuQFlo6htYg2KejW4rue+IMP7B3UpVuFNKfBHHoAXitN7PMHW3Q+mVSsWsIMwv0rxrfKeShtpkoO9u+fLyYOtV8FrrzFfx/xggPnkk3orCLiNOj7Eiq9ZFdn/suOPRuzmyM0pWLnVO3WUZ+tRz6A6+mIo2rHmc9u7ft+wwcZKkzgU+/dZFH3eraQK7KXs5oIN3kVcxoPq7wC2X+exVtFiEPVp6dSZaImnkHHMTvM8f6d+HRWWwotOe4nWm/NCoLRYyVp8MEhOC+PRjBp0Nh3/FUdbmwffrIX5efao/7rW4Yp664RFuKSjcTNcaFKqOvtLJu2UpK1AI6KD8fbLc12IcqqEEQOP20UcLW3Y8bWdZvg4dy34mLOT6jQicQP0GGx3PbZYijElE6P2BHg9vNSM4p/dAp/EC/Jm0v/CgZPPDtwB9xrminPDxbF0lrNDMogA2ov7AocEzz0OGFMFzjCQwWvVC4Cp9q89R9uVfSww9oGos26VxYU0yPdw7KLxctgvGeFCTdjYLsA8ydeBKzGvkfsTZoDl1C117KRp9SIOi1vikgs/wzlP30ZpGqM9w9OVON2oOj3U5w36GBt+x7RBpLbLUSma8lTZryMmjYdl/4N2X8QZ/DHvf5fjc6hbdoEcZpzB1emI1Uu9/3SqOEoPXPzqmZI9wXdAdw2m9OSxYvIQqbpR/Kc74ckngfKenk/sXR72+9vXgk623B5vtAE8=</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyeZAU5b6lMFpjSQkscZvpqfe7LNR7NoDx2kmyW2x9eGixSzTG4jANF0WdMxHYAfCBivcGJAK4WSTTzQitdyLv9hz8kOBVtsS803nd/act9+Vi9sKBB6M4cyYkxL4xY1rcq3/gXG/T2cAOJE8AShO/z3aQYaAFoMg+tVHzXWPeZ7PmR/t3usK2ZRxN/NoeYGantLbckW2GznfP2x8f/4KNZJ</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfMqvLqM7F4KfIsNFiMIReBD+rFJPIa8dVnPqfUr+cP1ybS+RtCT6+L/PbM39rEPMfc8Hae8k1WhNpAuDvAn2OMV9ghTX548R1rqXFvjDUSWeSVbAHvCL+mrsssSv55ZrjfHjgGaIeUTYjl01YkDnmo1yMm+6iLF5cZ8ddO63JU7pF5+boH7ceLEXn9ewU/epIgGlvkLvcFYwUOaEA3m7PrlcUQc227jyUcVMMwiiEwpQ==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22f+qeju1WMpdHTyKloCcPOarYTXazor00c26O1GpezfxoPfk7VNpDmTuRJ7h7Lb8aLEwgAPXviivczoRHaMs3l9B6AquKh1qLzNplLgmOJoC1GyngYtpQ7eb4F6stwm6mvd4R78KESUFCFMbKOm8kInCUMwqUU1DednSMTU8c/6DmEoOoxYWxdjzuh9/Snw89U8HElF2xLVATBvJ0nJg/Ba+NCToOlILSZqmkFphRjxH+CRjowzRcijvoSqUNkE1wMkZVNAme/9e8Lat7CzUxYWAqXbJSFznWDPn0KoxxzUKU9ZZ+F5IlOTQtBguZi5CTFAcmCqXqXU5ruaMttpqDiLnQkBczyZ74o2HHdPxuY+XGDYpztuH+HqMfruZss5OCw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KkyM+BtQQNcZk7mdKL5G+458XUG2IzAtOd+dl/37gfH8yfVvXm5uwZS8/9LwsIQp9PSPMSEOt2hmkohHlXQUuC3yXwmQ47txDlpexrvz6Q7hnCFwLy0r5R+Emv6uzFa9iDudPwNijvBFYJAhf2dqmFQ==</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyrbHcGKgLQlHwzG9OeaJurRpUxtRpsiU/VasauyUSukxv7UM+NaHYxA6YqfGHenQIofz0p+kMlegoYBLJ9GI5eVKUzG/4FNjWNu0Eyk9qu2A</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5VKcm/ftNpsgHVPiGXPUJs5QVFoBhdUYhWZ6oBKqXKkNOPj+XRkjWmLpIc5tfwV0BrFcfNpBKVvLF2XEBbLhfC89qysRQPxfeqF7596JfZChygxlw2uGb22+gctX5TEQH8I+ZumKM4vAu6LnY4YgxQC9togGR25DB3hf+UyrBBuGYmMeW4IIYwJCzXKQ8qyHR8vm6JORqCUXUA29D6HpFkhNwPr0CFtx/ccH0Mm/wuNIjzcsAa/GxREeznT5okEZ1ZHCena1YDcu7qO//WJ9ZiGxdSTXAGtlo7MvcZfvExXCuNPfzoAqZTnGYa6CJpkGg7/s9PTeaV4UbqMjXkAvm0=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZa8L384PUkg/4jpaczSTZ5aF4A/eQkAQqWsIx+wI7joA==</Encrypted>]]>
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    <action id="Product">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07PrFJLltRBgIfPi1JFFmf1IzE3HllkIrvbySZu6ceyNmwRo7DsKcrf6WHANt4PVhS5MzRKUJCYM4bR+40GGWlHw==</Encrypted>]]>
      </text>
    </action>

    &ListTicket;

  </response>

</dir>