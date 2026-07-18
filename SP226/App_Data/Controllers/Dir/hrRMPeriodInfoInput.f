<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLSuggestion SYSTEM "..\Include\XML\Suggestion.xml">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
  <!ENTITY ScriptSuggestion SYSTEM "..\Include\Javascript\Suggestion.txt">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVScHb0r68JzB4bfUvnQ8Rz3/1U0FOeo6XKBb6csgRfI3CC9V0XAEKAm6BSdG8uBSLTR8vHpuaiyvr2rVl0x/tLDWWAM7hPUEKahtw9wgRSPCociBUG8MJpugLDZsDmvqvg=FastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.hrRMPeriodInfoInput;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="hrrmdot" code="stt_rec" order="ma_dvcs, ma_dot" id="H11" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin đợt tuyển dụng" e="Recruitment Period Information"></title>
  <partition table="hrrmdot" prime="hrrmdot" inquiry="hrirmdot" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dot" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã đợt" e="Period Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_dot" allowNulls="false">
      <header v="Tên đợt" e="Description"></header>
    </field>
    <field name="ten_dot2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Thời gian từ" e="Date from"></header>
      <footer v="Thời gian từ/đến" e="Date from/to"/>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Thời gian đến" e="Date to"></header>
    </field>
    <field name="d11" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="242" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrRMPeriodInfoInputDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="status" inactivate="true" clientDefault="1">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Không còn sử dụng" e="0. Inactive"/>
        </item>
        <item value="1">
          <text v="1. Còn sử dụng" e="1. Active"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Date"></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="ghi_chu" categoryIndex="18">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="ghi_chu2" categoryIndex="18">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu3" categoryIndex="18">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu4" categoryIndex="18">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu5" categoryIndex="18">
      <header v="" e=""></header>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="### ### ##0" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="302" anchor="4" split="6">
      <item value="100, 100, 100, 137, 100, 8, 58, 42, 8, 100, 0, 0, 0"/>
      <item value="11----1--1---: [ma_dot].Label, [ma_dot], [ngay_ct].Label, [ngay_ct]"/>
      <item value="11000-1100-11: [ten_dot].Label, [ten_dot], [status].Label, [status], [stt_rec], [ma_dvcs]"/>
      <item value="11000--------: [ten_dot2].Label, [ten_dot2]"/>
      <item value="111---------1: [ngay_tu].Description, [ngay_tu], [ngay_den], [cookie]"/>

      <item value="1: [d11]"/>

      <item value="11000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="-1000: [ghi_chu2]"/>
      <item value="-1000: [ghi_chu3]"/>
      <item value="-1000: [ghi_chu4]"/>
      <item value="-1000: [ghi_chu5]"/>

      &ListView;
      &PostView;

      <item value="------101: [t_so_luong].Label, [t_so_luong]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;
        <category index="18" columns="100, 100, 100, 137, 100, 8, 100, 8, 100" anchor="2">
          <header v="Thông tin khác" e="Other"/>
        </category>
        <category index="-1" columns="100, 100, 100, 117, 120, 8, 100, 8, 100" anchor="2">
          <header v="" e=""/>
        </category>
      </categories>
    </view>

  </views>

  <commands>
    &ListShowing;

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6iBTGyQj+DNp4QBhsmmGp/yeGjTnHySD64CBWT1K3Bzc2/e+BxSiz7FWoc1UbLyf51</Encrypted>]]>
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvlZeUZOV5tyjxTCui6Hv2VLyoZWA+VwmGBQoHrngwz9vB9JM7rVP+E2pLKf6ZMM47OXsioCkS8CXb/ZzBziCV2u</Encrypted>]]>
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyaVpCbdGljJ0ivNhQve8w9M8kTybtH21DvisbTh6HRwUclnexkv4QDe/dFELBBlQew+Rmk2uiPOzNSGDDoLtUgNky+Qq+RsW/A8I539st+VgINGRlOVxt23inoETbKILT/KIXqHKGPmNI8jY2v85QJaWupWTKNG7PLnojCf8Rn5eCeHKQxlcftSLfGul1WSgw==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVtXqV6hv2JaTkzbr8YoBuWrBzn/Uxc6+KEcRvwqe9u66pXbj+P/OkfE+B9HS/jNIxqXsJquL0g991JzjsvfQ+7PnK+61j3aYnEJuFFR5rQMTIbGJish+2HRUNY4B3F7enkV5ggnt9kq9nHVjMMXPK5OKQfA4zkwyK1RyFwg0p0ZENnTMb6kQ9SPHOVN7u3YqZ3ZMUbr/5JZT6au2tGot7XIgET1lrRWF0Qxoh/5lTYSlZ1t/7xSyjwUzVH4+OQrL6pCgt6urbdHFQz3E5BlILm7zK1goLJWQPh+vi9QfdwZtstbXr88dsmTlbY2meq63ixgwMsThcixeEjPmGKlr/yTcNOm76gEzTwnSCdYLoK8nxC3AZF+YePiE63c+K0r4rncYIIQHIXQhj5nMOfUSda4TOaianCuD6iBUxk4hTrC4=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24Asn8hzCPN+Oq+suHcjIsVM4VOY7C7+1pN/Bz6Xq+wvSpiem2eUrB3NEBYcQLJ6TBbhAFjYGy1CpRx4yJ0iodIDj2DBQ4pDfu9AgKRPg1WG+0jfFwJ3Fl3mq3q8kpymDg3oap3jCRVHMH23uzwONBqIpE</Encrypted>]]>&VoucherLogStatusKeyLookup;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUOvMo6YuAgrcBXkU2KWtOitcHXiPkspeh/23PVoTRoGeSshzc54eWGMwh4uWsuBoV0pUd/LHcKQJ0AYUjo7gjtu6lDlujzXfCF03R+2lydBWw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIN5R6srW0hRBEXXYhOXMh4QFwEIzZPB9sVS7VZ7aoVbqAu1ZeVUWkOFXS/P7ei7pSHLBM/gPcu2aPa/7bga/o4Lt9kdJx/qo31446HuctibyU1/0aEXKbMdPK6CTLDpznCZe8PXDc4shlURew949cVcA2m4eWwOUGy/yzGQO3CrsqWaRK5pz0vVKuXrTHv9IMtg6HPajZCHMubWYORVChgP0EvGViomUZOVfEnMC5IjrRL6QYalTBLKfNQQIaDuMw==</Encrypted>]]>
        &AfterUpdate;
        &ListDeclare;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34IHlwt24I/MArn2WpObnAPduKHJ97ui5TegkWIMiTZvSy9lKfczOOaVkGJKVquQm+o=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6mTJiZpuAYAKBwWtI8N/7YpW4AagHrywwZIFnXbN/MJ5XqMKCwF4fiF5YXf8kSJn9NPfSNJs4v1hk2Hj+aWU3CJ93V5wk2kCe2e/kRd6cKqOTJBUtYlcPE0gGPdN9TteI=</Encrypted>]]>&VoucherLogStatusKeyLookup;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUOvMo6YuAgrcBXkU2KWtOitcHXiPkspeh/23PVoTRoGeSshzc54eWGMwh4uWsuBoV0pUd/LHcKQJ0AYUjo7gjtudhVdiyNGDUW/bJ4jiXXuIUrCGo/SQfdqwbDPuyw/nZgjuMDZj1MtrWfML0/XVZ9Nz4Ckoh4oFvR7rW5jabOu85MpEtkPVE5doiySGLFO3MqpCvXpo+HhfS2TKo39sHCVHW249ejTtjXnsCMTey/wSESmS4qOFkDDqfTlvOI9UZUPAJ3AniZW8k5kMbFyilKsKcPCdBax4blWJwqf90qvjCOYFPRA8WiU2iWLlkzrO0g=</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aYxTCATgGAUHUDgxSjB7FK44EqcGk5+HwHcxZM/PJyoAnl2r2QxrEdSBp40cjHT8dbmrDhYkvaNQ1tWTKXObwwPOXOetsfPJ8165X5gDOXiig6kOQEUCBuO+KU2xAVxzWHCCOOk0aZ0Spj3JqFcw4k7NTpwieBlIq89TEdyCK0y5eEkWVcfGPbx02uelW798a3o2wMv/5kOzKCbcnoB9gpRu/l53rgX9Xs6pdr8JBTvYqb48CGs0Kylo3OCxV008g==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aYxTCATgGAUHUDgxSjB7FLWna81ZOCFWtqCqs1pMQi0Ydc6cDbJ86UxsEWFwtNLHGXj1ryuKLOAnAQcrm/jZg+9ntQRtZpS2uXbM/55LnbtEtak3uTE54nyL5n24wYwhMm7EeVCyx2f/7TZaVofSvX8RiGTL+Rx0q535kg+Sc/+gnLsGX5xbHVbecLMqowdV88F03BQSWxVsfN4B+WKJ2KfcLJWbhVt6mKNa1Zrwym3F+6tMl6RgZKS5JP+n9imhwy/zGdBBmk+N+7p6wFfQkquTJcRryDmtvC4tNlsk4y27pWRO/ZfuHMBZL9jOPL+QY5ui9j7S+UUkD0co+Qtpx6pJESsc3CaJJ+Mz6CkQobX8h0C9OgG/KJaIGKc7GSUIg==</Encrypted>]]>
        &AfterUpdate;
        &ListDeclare;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8zSA1iHGPbAxnLbYo/OaEwxaZa63vzq/BWTDFMammx+pT5Zrg2wNP91IMgWonPMA0k89pfMMlr1NLHzHGzraoxwLwAzxxalj1/z/fdE6lG61Wd3tJvL056r+U9iW2ECIXmxVCbZWEGoAfbW9T8C0C4mQaRyVB02g+oUOukYQnyWurSJeR9KC8zD85IjDc6NcIMo6zUBV+Fln2cGG9KZCrJDOUhyRGk0yu6Y4srkkQ40SA0ap6qhv89blxz7JSgNTKWKkBGTz6W0RWNPxPHphZzK4tZRfUKkye67GR7LalYeGKOdpbhlnKgGlh6zgU58rsXtJ47qtCuhiN+L3cX3jiIV8mSlIFSpOxVSc+BtBqXedJKEYf8RzoZ8HPKq2ajGkBu1rjZ3BxKRDmxq7CWn5NY=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu166b7sQeifYwjA79KkE85gQDAxc8N48emBOdr2p+oaV4BQBFYZi6nq9pYXzL2Mgww==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &VoucherLogUpdateStatus;
        &VoucherLogBeginComment;
      </text>
    </command>

    <command event="Deleted">
      <text>
        &VoucherLogEndComment;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event ="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzg1CnqAqiGaVcLrReGHQaYddEdU6bYnIwAlb1T4gnVL9kzY8KQ+9eBMn19BijELkEaV3NyrxcXIZFPNHBhVkkpjIqaPVmidATJTWzgl3JGXzIKB75pQ4EU9/kpFB5Ljt9sxV7VfRo4xwlLa/HHaut4a4DHUEj8kracOdzgQIxinuGyeV8Up4OB3p9iM1JsMTXCAhOC5h4ZvdwayJYHrxvFYLCF15YU2K5XSlC+sUiLWCRN6TwuGAB1u+M3wrYtZlXdJtTQDRYlqZFyxJ7THeImwkCJUO6+NsG2nbph4dxuvhtnssBeQMXPfzdZiH+SpMBl8JVzLkbUarq6phC7i9a4fQsUqAYKKTUTm8sn+dYkRTi0eKxv9NSS6l0x0PK4YufqWc50Dx2MZL0L2fC1P1bfmvYBivY1mno7nb7VnopJ1EmuzClphiA8twa6kjpS7ecZM488yZiYHq46ss5sdEnfaeE/QzSQv2eOB2atcWfSj236mMVnF53HEQA4URIOhHZBxjVUcE20erXnoGG/iaqtifzjt9EzCQQHWIKEO10vcdiWANwjIAlKl+tJVAc8vda3fC54d0h3PEdWd7AT/91a0pbnwMMIUfesje/UO30zIKBXtncOiKE7cI43ObuQJmDEvry3Soq/TuEx9ZU+0741ZE7/JuGyHas9Vppc/KzBYI+Rjh9w7blS2JlF36BtVnPPSvI+iKey0x0XAonYmgpShfrE1HoWjrBPuQl3mcs0mgRitIqEfF4lzqRp+/3dODbCt41wzvQwsP3wp5r52AAiWycvF0sI+c3C3lAkTt7f8+yr7rAQr7YqKdvuwjHSMz8lpH5tjkDRhoWTpDXjUq3g</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyctttQFkPUSHA8a4RLwhbf4S+SJnfKgl2At+HSG8rHPmggkjD9KSyeG14PSsBrRn24rgHcWivIckFUIzQeVHRfhw6gWNT+/ktTH2jrpJvLVeZeUr8/UOA3S35H13YRVnD4rAqjOk9/iYJDqU5cHZYhtFg8fRa1OAFHuM4ezu5tqqSXuiIPPeeaijKmFTstFWMK0ngk9vMMmt3H5KxA1bxtM6BqQRfrKSFYE6VdtvkXCHIoXMYcb2i6paY5gMLZ2Qw2LRH72PEjq4fas13n7A5z4TiRFIzVGoIiEo7FKAHRPJw==</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTdvYXegUDTe7Rasrr9hsI6RO0uRMiN7pqog2gtUXVaSLegpXYPjtD7xw203GMlXiXCsiQqguQnUfFen2ZeEFRikuDlap3L5VhpNv2rA2+r+iVQjyQRjKm3WOzDAzSl7rWQ=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWym9wbgs85nvalQ9Nb4tkNBXBiyo5HKNhq/fAOHfPneBzWrwjs5uKff66fJO0FqBRHJAKDY6MGhqUvmZkxfNONCLgA5T309yAcqeEdu83E+XGVJvahf7Wv15eYYt860rw0ZMNsljIxesqDTTnVMvXoV3G/XnCyGKs6yX2XLa3fFZBDtljCgTclyhz7xBhJOk0Q6KUnC4OyV6+Y/56NIu3Pe9M6J9DqF0xBb6v7FqLVTF+hftziXSR3iVjBuFx6ZIpXgrG6vt4k9Pg0TrzcvJFAso=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacez+QiM3XFR8SddZwF4qqrpxapQiaXRJw/lDVRGYAgl9uNGLPQT8VNMOv74yp5v/ZRBjlHvyZa2bmw1KD3FfiLosF25Xsgd9Coy8b++b4LStoOC2ePodCFVZyquHIUjTlzZtiLX/XKAuCbrnrfMxNXNGfEs/y+Cur82iCKacq8wk8RV2C3Myy/YTwuzt8hqEUBz</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4faFOs+Xs65Ec+Ah6eR51ky57l+bjdCHquz/pty8nxIer/RslZHJHKguDfl3iy/3dA==</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8K1RVCY4SdjgcsgWvnNvRWMjDE7hA/8ie5FicSB1OPX2b112W1p9/uoSLogg7Dmj4G6fy++nk1VdVD1CTB2v8n+wnbATE2iCB/GN5DhdO5DUfjcuO6E7zl5Re56heCYKXOlHh+p8LilL3JG8LDD8X8tGS3Wb2ij26jDdg1SZcMcYTKIS4a299Eu6zACg9eZlNj2ZMLhOsSTfogakIxZtvmHgkMmvcOU4l2HQD6r6WakMUzctbYKNlguNmbKnx5G6R/</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UkyML8OU9Vm+C05wYc54p4RUPqzuVACPOdM5VKLPZgxXZkJapEt8t5kmMMeA91VkvyAZWMwrAxr5ITPE6Hj4oJHxtWsQX7GtDtYA1JeK4C6</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmFeQqAuO58mRNaN/M3pDc4KJgEkzV7ps3Z0Erp+8gZScgORGM220HflsxuyRv1fjmfSJ5OkELwTxi9dzKAli1WkoI/xCYnFudOLQnYfKhSa0=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&1+Z6etuWUrSzIvaKA+yQnudi9W8QavxFClZq13wFt0ZJKyJMnMQLngRcUKe3CjpZ</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TgUTPZ2dcLCXC0JLs+ueAI=</Encrypted>]]>
      &ScriptSuggestion;
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    &XMLSuggestion;
    &ListTicket;
  </response>
</dir>