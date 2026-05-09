# Article 6.2 Policy Wiki — インデックス

> LLMが自律管理するWiki。手動編集は最小限に。  
> 最終更新: 2026-05-10 | 対象国: 日本・シンガポール・インドネシア・フィリピン・ラオス

---

## クイックアクセス

### 二国間合意マトリクス
→ **[[matrix]]** ← まずここを見る

---

## 国別ページ
| 国 | ページ | Article 6.2の役割 | 成熟度 |
|---|---|---|---|
| 🇯🇵 日本 | [[countries/japan]] | 買国 | ⭐⭐⭐⭐ |
| 🇸🇬 シンガポール | [[countries/singapore]] | 買国 | ⭐⭐⭐⭐⭐ |
| 🇮🇩 インドネシア | [[countries/indonesia]] | 売国候補 | ⭐⭐⭐ |
| 🇵🇭 フィリピン | [[countries/philippines]] | 売国候補 | ⭐⭐ |
| 🇱🇦 ラオス | [[countries/laos]] | 売国候補 | ⭐ |

---

## 合意別ページ
| 合意 | ページ | 種別 | ステータス |
|------|--------|------|---------|
| 日本-インドネシア | [[agreements/japan-indonesia]] | JCM | 🟡 移行協議中 |
| 日本-フィリピン | [[agreements/japan-philippines]] | JCM | 🟡 移行協議中 |
| 日本-ラオス | [[agreements/japan-laos]] | JCM | 🟠 移行遅れ |

---

## 制度・データ詳細ページ
| ページ | 内容 |
|--------|------|
| [[projects_database]] | JCM プロジェクト実績データ（国別・セクター別） |
| [[singapore_ia_system]] | シンガポール Article 6.2 調達・IA制度 詳細 |

## 概念解説
| 概念 | ページ |
|------|--------|
| ITMO（国際移転緩和成果） | [[concepts/itmo]] |
| Corresponding Adjustment（対応調整） | [[concepts/corresponding_adjustment]] |
| JCM（二国間クレジット制度） | [[concepts/jcm]] |

---

## Rawデータ一覧
```
raw/countries/japan/
  - jcm_overview.md         JCM全体概要
  - article6_policy.md      日本のArticle 6.2政策
raw/countries/singapore/
  - implementation_agreements.md  IA締結状況
  - carbon_tax_framework.md       カーボン税制度
raw/countries/indonesia/
  - carbon_market_regulation.md   国内炭素市場規制
  - jcm_japan.md                  日本JCM詳細
raw/countries/philippines/
  - carbon_market_framework.md    国内制度
  - jcm_japan.md                  日本JCM詳細
raw/countries/laos/
  - policy_status.md              政策状況全般
  - jcm_japan.md                  日本JCM詳細
```

---

## 自動収集候補ソース（将来の自律化に向けて）
→ **[[_sources]]** に詳細リスト

---

## Wiki更新ルール（LLM向け）
1. 国別ページ更新時は必ずこの`_index.md`の日付を更新
2. 新しい合意が締結されたら`matrix.md`を最初に更新
3. rawデータを追加したら対応するwikiページに反映
4. ステータス記号の凡例は`matrix.md`を正とする
