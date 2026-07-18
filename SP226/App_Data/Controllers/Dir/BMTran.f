<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu0D82jUeZxaMtyqicDeohsH2EluyUuHUeRI3D1TtElr8J8OpYA5WCYRuJvDmlArfhZ5Tawb1zIM9cA7uWQX/lmso7NQRnN6LSBkvhA2e+fqcHlD+fF3iilzvOXMQWDuOdWlSQ3GW3Y6HzEMKF8S3BoCa5bmn690JGlE78QkdAxEj6eVSzXTscO8KZC4fUnwnYIznAQut6pZr9v4bH+cb6GRY9o2FwifPGgr+GIW1paJ8CqsZ7MppX2Z5Xyf42yCCSURqQnFzyDvBjzC5QhQuOq40WKgLTtX3c48isziHea8gyzzRqwS3FF7niiN5LkwPsQ==FastBusiness.Encryption.End">
  


  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.BMTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="phdm" code="stt_rec" order="ma_sp" id="DM1" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="định mức nguyên vật liệu" e="Bill of Materials"></title>
  <partition table="phdm" prime="phdm" inquiry="idm" field="ma_sp" expression="''" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" allowNulls="false">
      <header v="Mã sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$vdmsp.ten_vt%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7O8EheGyWBp7OzkyeKxaXsIwTIfqYkVHN7RSSROjlVYA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" >
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dvt" allowNulls="false" inactivate="true">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="ma_vt = '{$%c[ma_sp]}' or ma_vt ='*'" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ddm" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="266" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="BMDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@coefficientInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="326" anchor="3" split="6">
      <item value="100, 100, 353, 100, 0, 100, 0, 0, 0"/>
      <item value="111000001: [ma_sp].Label, [ma_sp], [ten_vt%l], [stt_rec]"/>
      <item value="111000001: [dvt].Label, [dvt], [ten_dvt%l], [nhieu_dvt]"/>
      <item value="111000001: [ma_bp].Label, [ma_bp], [ten_bp%l], [cookie]"/>

      <item value="1: [ddm]"/>

      &ListView;
      &PostView;

      <item value="---1-1--: [t_so_luong].Label, [t_so_luong]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 100, 145, 100, 5, 100, 0, 0" anchor="1">
          <header v="" e=""/>
        </category>
      </categories>
    </view>

  </views>

  <commands>
    &ListShowing;

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcId2xB+L9A0FuJAQVgRyH0gs8UwtHLYufRgNmsOJALcT0iIo3bguWm6r3Cgvh52GNQkjv8hrtArGd23uR9z3D03GHEeMNrZQcZ1FuRT1IrbN</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcL1HxHvL7ZCETdz70FGGQmy5RIEp+a8teSHFqr6vx4wVRY1okSfY+eBBG/pMzcCwGuxP7KO2Glx6Re3ktYWLj3U=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyaVpCbdGljJ0ivNhQve8w+0WE+YGD+Xs2lctzeoiyOJH/h8SqxR3WPwXECQd198tCC/XFlxcPPsbgWIIETqz48RYzO1iBCzfOUaMrw+Aw6MW1HRPprjBfaIjsSgYfjBkxnzB8JlxfnvZY4d7ehpro0VJsnT8LTbpyDPQN5RE6Lr+eVEvgSh3i5j780LITXEIUSQLWtbzaqh52/qpGmTAFOMxMGWlJItIXvHBW554ejq</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcABCz+CaAX0lpfMh9FbWFFjuVlYfG4F06mqTTp1YSsz/2TKj6b+Ry4VD7Kmz1pSNwptZXbttFP3/8pwGkNgE58BwZ/PX35eEwAljDehldGaF8nWuGqc+Q7W804ohWMeufjUeBLrGTzLrFzsbq/lFipt8+0r2Di/T3Ev/U0+ea80+b3eLPE85zT8zVeGuwmo8WueB/beVE95p4wU7jdzHpocB2ybSow12+bc8/PFbyUOkWYfT8U27OjjfSXY8xgoxFo7Bbb2YMsBxc2ADucCHjMCOJd2PZfXNEla334m2g03B</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDcn4sGEJMBMSm+DHocL8K7Nzze8fDYSl5BeXaB76RXTdKYi7cPM3r56YpPzLkN8RbGQkT+XDipDho5+5VvDsR4+fpROdmsmLFiuUZD9XoXTMc7rHwQ6cNBFYQg+kzOt6w==</Encrypted>]]>
        &AfterUpdate;
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0wwC+To+U3hJFkQDEkgMNaVxRVDarN56oMJe33BFsVNsn78i91f3K64WJT1iSYobUw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5nwolOpvg9eVPRAgzaBSQ+zYgTq0BawAWcBmAEBHRhcol6eW1NfL4xR4C5WSj60P+eKYaa6YPSFkFpbwMVvEpUSZWE+bG0tcCNHV8S4ilXyhnmQC1p2J67E4Y3wpM2Oi5HFINLxIEXCf74A0gDhhe8CPwkqI0xQG/Xspbd+bHG1g==</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a9oW9kbXgeip9IYI23OMRi9wYHAuYCdBgC6ceg06zUIlmHbk+f9CmD8zdGqMf/RobP8fugrPmbgTZK5YcF9DxuFU63PGzls0zhCMaXOsi2/PWTcMQY9/T0mtr7PxzZkIv1ReJtyBRzT+vryQ4uvPGvHetjoi8zgJza4rux1UShT</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a9oW9kbXgeip9IYI23OMRi/4mGHmr8AwPA2W2+u3EdnW8tQBXZhK4a0l2+Tm+mECWce/e3R0RYusPEpoDYA3ejfn46NKnKixbDzlqnZaamNH2QFDANb81f6w3TQ/dTSfqwm48X3L6LoOTSGftF28Hrz+v8k+9hraugsYeFqIKHvLrASVyiI1ivvT2QRloq2gJKtL5rVy1UqjlQqmfmus4AxoGYSBEjuk5Dq9vHfzNL8adeEnFUkxIqQ6gzcebiEvQ==</Encrypted>]]>
        &AfterUpdate;
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3zrQxD+nGbeV3BPmGIZm6OjybhwLQexcZCAqTMtk/ZiA3COnpUd0+AlDbo2pzIOEw==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTAc9tMSMH/XgUA/7XCFfgKHJWSLkUf672ZtAQPPd65DatH5X4RWwJ7fCLyIWHc8B00aApM2s9hj0De2ZUPs+hsK0z+MccheZdKs6mE1Ac2E0NF/t747Al+uvdQMjNe3WkH8HWC2ZMowZ6rrdCQbgbZIrkYpLWXsyIdfMr925eyLKM4aQU8/Jx4Vj2Uo+X2FUW5KeW0l38khslYEWUUmwLV1TIFP76V8h/LHaU2g0hOqGeDydmNtuBTS8qme2nvk7WBKWQgjX5iAZHsqnd/AZ8zc1N63nPqbXAWGwEQFTtSeDzfHHC+CgByvqkndbAtTf6tSc6DY0QfGqWjE0Aojtxu9D7N/ftQyvj3/6Qrh3XLZGFUX0q3PLqSxfF/cTf9rE/HNRzNqTu8ItPNmEW1lvED/GHe3zPtZSgZWjlmlpsWEk6WCcH4PEKgR+Hpja9CRMxcNYJpX3DOrMBxikMnSGrwNocEfVRAX0+ZGs2j8TzokreBVjxEf7grPcM/UH02G4DXa+0y2NWay3G6s2qxc5CbCAfLgU6hOchYNlwO6eRV8IL8svHpetHvfAyw1KEc8PmKmCuHViEadRMRqKbTfJZJc=</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyeZAU5b6lMFpjSQkscZvpqfe7LNR7NoDx2kmyW2x9eGixSzTG4jANF0WdMxHYAfCBivcGJAK4WSTTzQitdyLv9hz8kOBVtsS803nd/act9+Vi9sKBB6M4cyYkxL4xY1rcq3/gXG/T2cAOJE8AShO/z3aQYaAFoMg+tVHzXWPeZ7PmR/t3usK2ZRxN/NoeYGantLbckW2GznfP2x8f/4KNZJ</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfMqvLqM7F4KfIsNFiMIReBD+rFJPIa8dVnPqfUr+cP1ybS+RtCT6+L/PbM39rEPMfc8Hae8k1WhNpAuDvAn2OMV9ghTX548R1rqXFvjDUSWeSVbAHvCL+mrsssSv55ZrjfHjgGaIeUTYjl01YkDnmo1yMm+6iLF5cZ8ddO63JU7pF5+boH7ceLEXn9ewU/epIgGlvkLvcFYwUOaEA3m7PrlcUQc227jyUcVMMwiiEwpQ==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22f+qeju1WMpdHTyKloCcPOarYTXazor00c26O1Gpezfxt76Rn41rWO9S+C4GpOsd21aEKscyrvkbPbtpOXB1i6i6kkOrFNH/p2CGdPU/cqYYi1XvHwYbOXDG0pjCY1R/ctnN8361muuZSUbvDyiPE4XC3vwIoW7R8tRBEQ8jS/dcyl51uVr4ZTOpVE3EIGaLLCHx8PlG/TaydYcVYwhXSQEeZT89RoEABYzRZ+UFq/axSQQwjArQyNL9s/WR8uY3IZB20rEzLLxYcsMBR/rCgrY/3/ue1RAVdFT4AaikWVfCnqDWoFH8LhyW/Z2aOnPJEl6nTHk9La9B710bpPdsaD7S9QgElmaGPQHrCrn7dn1lRY7vMc5hDV8JXYM6Tmz1FveXTt5N/MbOUqELVbvKKI5m82t5hfQ1wzONs90S5m3v</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KkyM+BtQQNcZk7mdKL5G+458XUG2IzAtOd+dl/37gfH8yfVvXm5uwZS8/9LwsIQp9PSPMSEOt2hmkohHlXQUuC3yXwmQ47txDlpexrvz6Q7iqMA/iPmHd6+ndjq4kEr0mXYbZLJHEqPWFzrSodryE0n3gLJ1IZQq752QoumWZJ/M=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP8tlib1OD4QSA5Sl9Qe01zs=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyvN7YKN2lX7KcyBgs/ok+VkcrNaBthl3yqxBSKbkS0kKDd9xg5HsCRru0vr4lFUyYSMGROhuOCUyaL9nGSOxA2jyYGrnfPaukuD4k25uLKeh57/DVTJ4rWWibGUIFjwt5ZadSDIQiWU+mJN2VtveuG7pvGYydZ9wwvVtwinkk9kB95PM7/IW03+k/ofCPUZ9cmSglhmjZ0afuuYgqB3CHWUU8tAA7PbaHSXRWJ0HHKXgrSrY2ylnMBToFeey9x11mnsZ7fDTtsA1MJHuzOJDNJoA3fg71PcQ6ZtQ5Xn/Jo+vvmTcJ563OHFPGTD/7d2Mfw==</Encrypted>]]>
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZa8L384PUkg/4jpaczSTZ5aF4A/eQkAQqWsIx+wI7joA==</Encrypted>]]>
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    <action id="Product">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4GsLten1tKUqSkP+hoIEPTYvPWoXWZXfno8qy5q03f4uXu/Cfb45OGDWEdZpaAER9sjUy3b3YPb+ZFkqAYzPTPROL87F8/Uxr2p91D+eY3zow/sIShSBalpOMR/yGcf7Y=</Encrypted>]]>
      </text>
    </action>
    &ListTicket;
  </response>

</dir>